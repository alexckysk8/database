#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -tAc"

echo "~~~~~ MY SALON ~~~~~"
echo
echo "Welcome to My Salon, how can I help you?"

# Function to display services
display_services() {
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while IFS='|' read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

# Display the list of services
display_services

# Get service ID with validation
while true; do
  echo -n "What would you like today? "
  read SERVICE_ID_SELECTED

  if [[ -z "$SERVICE_ID_SELECTED" ]]; then
    echo "Please enter a service number."
    display_services
  elif ! [[ "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]; then
    echo "That is not a valid service number."
    display_services
  else
    SERVICE_EXISTS=$($PSQL "SELECT 1 FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z "$SERVICE_EXISTS" ]]; then
      echo "I could not find that service. What would you like today?"
      display_services
    else
      break
    fi
  fi
done

echo
echo -n "What's your phone number? "
read CUSTOMER_PHONE

# Check if the customer exists
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$CUSTOMER_ID" ]]; then
  echo
  echo -n "I don't have a record for that phone number, what's your name? "
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi

# Get the service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

echo
echo -n "What time would you like your $SERVICE_NAME, $(echo "$CUSTOMER_ID" | sed -E 's/^ *| *$//g' | xargs -I {} $PSQL "SELECT name FROM customers WHERE customer_id = {}")? "
read SERVICE_TIME

# Add the appointment
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# Get the customer's name for the confirmation message
CUSTOMER_NAME_CONFIRMATION=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
SERVICE_NAME_CONFIRMATION=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

echo
echo "I have put you down for a $(echo "$SERVICE_NAME_CONFIRMATION" | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo "$CUSTOMER_NAME_CONFIRMATION" | sed -E 's/^ *| *$//g')."