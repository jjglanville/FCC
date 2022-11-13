#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then
  # check whether winner is present in teams
  WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")

  # if not present insert winner into teams table
  if [[ -z $WINNER_ID ]]
  then
    # insert wining team
    INSERT_WINNER_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams: $WINNER
    fi

    # get new winner id
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
  fi

  # check whether opponet is present in teams 
  OPPONENT_ID=$($PSQL "SELECT team_id from teams where name = '$OPPONENT'")
  
  # if not present insert opponent into teams table
  if [[ -z $OPPONENT_ID ]]
  then 
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams: $OPPONENT
    fi
    # get new opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id from teams where name = '$OPPONENT'")
  fi

  # insert into games table
  INSERT_VALUES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ $INSERT_VALUES_RESULT == "INSERT 0 1" ]]
  then 
    echo Inserted into games: $YEAR : $ROUND : $WINNER_ID : $OPPONENT_ID : $WINNER_GOALS : $OPPONENT_GOALS
  fi
fi
done
