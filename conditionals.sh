#! /bin/bash

age=17

if (( age >= 18 ))
then
    echo "Adulto"
elif (( age == 17 ))
then
    echo "Casi adulto"
else
    echo "Niño"    
fi