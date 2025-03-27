#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "Inserting data into teams table..."

# Extract unique team names from games.csv, skipping the header
cat games.csv | cut -d',' -f3,4 | grep -v 'winner,opponent' | tr ',' '\n' | sort -u | while IFS= read TEAM
do
  # Check if the team already exists
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")
  if [[ -z "$TEAM_ID" ]]; then
    # Insert the team if it doesn't exist
    echo "Inserting team: $TEAM"
    $PSQL "INSERT INTO teams (name) VALUES ('$TEAM')"
  fi
done

echo "Inserting data into games table..."

# Read games.csv data, skipping the header
tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Get the team IDs for the winner and opponent
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  echo "Inserting game: $YEAR - $ROUND - $WINNER ($WINNER_GOALS) vs $OPPONENT ($OPPONENT_GOALS)"
  $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
done

echo "Data insertion complete."