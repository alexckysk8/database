#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -Atc"

# Function to safely quote strings for PSQL
quote_string() {
  echo "$1" | sed -e "s/'/''/g"
}

if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."
    exit 0  # Change exit code to 0
fi

# Determine the search type (atomic number, symbol, or name)
search_column="atomic_number"
if [[ ! $1 =~ ^[0-9]+$ ]]; then
  if [[ $1 =~ ^[0-9]+$ ]]; then
    search_condition="e.atomic_number = $1"
  else
    search_column="symbol"
    # Check if it might be a name instead
    NAME_CHECK="$($PSQL "SELECT COUNT(*) FROM elements WHERE LOWER(name) = LOWER('$(quote_string "$1")')")"
    if [[ $NAME_CHECK -gt 0 ]]; then
      search_column="name"
    fi
    search_condition="LOWER(e.$search_column) = LOWER('$(quote_string "$1")')"
  fi
else
  search_condition="e.atomic_number = $1"
fi

# Construct the query based on the search type
query="SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius 
       FROM elements e 
       JOIN properties p ON e.atomic_number = p.atomic_number 
       JOIN types t ON p.type_id = t.type_id 
       WHERE $search_condition"

ELEMENT_INFO="$($PSQL "$query")"

if [[ -z "$ELEMENT_INFO" ]]; then
  echo "I could not find that element in the database."
else
  IFS='|' read -r atomic_number name symbol atomic_mass type melting_point boiling_point <<< "$ELEMENT_INFO"

  echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
fi