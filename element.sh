#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t  -c"

if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."

else
  # check what type the argument is

  # if atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    RESULT=$($PSQL "select elements.atomic_number, symbol, name, types.type, atomic_mass,melting_point_celsius,boiling_point_celsius from elements left join properties on elements.atomic_number = properties.atomic_number left join types on properties.type_id = types.type_id where elements.atomic_number = $1")
  # else if symbol
  elif [[ $1 =~ ^[A-Z][a-z]{0,4}$ ]]
  then
    RESULT=$($PSQL "select elements.atomic_number, symbol, name, types.type, atomic_mass,melting_point_celsius,boiling_point_celsius from elements left join properties on elements.atomic_number = properties.atomic_number left join types on properties.type_id = types.type_id where symbol = '$1'")
  # else then name
  elif [[ $1 =~ ^[A-Z][a-z]*$ ]]
  then
    RESULT=$($PSQL "select elements.atomic_number, symbol, name, types.type, atomic_mass,melting_point_celsius,boiling_point_celsius from elements left join properties on elements.atomic_number = properties.atomic_number left join types on properties.type_id = types.type_id where name = '$1'")
  else
    echo "I could not find that element in the database."
  fi


  if [[ $RESULT ]]
  then
    echo "$RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

fi