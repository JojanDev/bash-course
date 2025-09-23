#! /bin/bash

age=10

if [[ age -gt 18 && age -lt 40 ]]
then 
    echo "Edad valida"
else
    echo "Edad invalida"    
fi    