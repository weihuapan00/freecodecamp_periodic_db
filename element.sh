#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t  -c"

if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."

else
  # sql query use or condition
  RESULT=$($PSQL "select * from elements where atomic_number = $1 or symbol = '$1' or name = '$1'")
  echo "$RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
  done



  # check what type the argument is

  # # if atomic_number
  # if [[ $1 =~ ^[0-9]+$ ]]
  # then
  #   RESULT=$($PSQL "select * from elements where atomic_number = $1")
  #   echo "number: $RESULT" 
  #   # else if symbol
  # elif [[ $1 =~ ^[A-Z][a-z]{0,4}$ ]]
  # then
  #   echo "symbol"
  #   # else then name
  # elif [[ $1 =~ ^[A-Z][a-z]*$ ]]
  # then
  #   echo "name"
  #   # not recognize
  # else
  #   echo "idk"
  # fi
fi