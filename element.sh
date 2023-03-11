#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."

else
  # check what type the argument is

  # if atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    echo "number" 

    # else if symbol
  elif [[ $1 =~ ^[A-Z][a-z]{0,4}$ ]]
  then
    echo "symbol"
    # else then name
  elif [[ $1 =~ ^[A-Z][a-z]*$ ]]
  then
    echo "name"
    # not recognize
  else
    echo "idk"
  fi
fi