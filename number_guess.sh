#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random secret number between 1 and 1000
SECRET_NUMBER=$((RANDOM % 1000 + 1))

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if the username exists in the database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -n "$USER_INFO" ]]; then
  # Username exists
  IFS='|' read -r GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  IFS=$' \t\n' # Restore default IFS

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  # Update games_played in the database
  $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'"

else
  # Username does not exist
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Add the new user to the database
  $PSQL "INSERT INTO users (username) VALUES ('$USERNAME')"
fi

echo "Guess the secret number between 1 and 1000:"

GUESSES=1 # Initialize guesses to 1, accounting for the first guess

# Start the guessing game loop
while true; do
  read GUESS

  # Check if the input is an integer
  if ! [[ "$GUESS" =~ ^-?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if [[ "$GUESS" -gt "$SECRET_NUMBER" ]]; then
    echo "It's lower than that, guess again:"
    GUESSES=$((GUESSES + 1))
  elif [[ "$GUESS" -lt "$SECRET_NUMBER" ]]; then
    echo "It's higher than that, guess again:"
    GUESSES=$((GUESSES + 1))
  else
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update best_game if it's a new best
    # Fetch the current best_game from the database
    CURRENT_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

    # Only update best_game if it's null or a new best
    if [[ -z "$CURRENT_BEST_GAME" || "$GUESSES" -lt "$CURRENT_BEST_GAME" ]]; then
      $PSQL "UPDATE users SET best_game=$GUESSES WHERE username='$USERNAME'"
    fi
    break
  fi
done