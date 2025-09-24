#! /bin/bash

echo "Valor 1 o 2:"

read valor

case $valor in  
    1)
        echo "Numero 1"
    ;;
    2)
        echo "Numero 2"
    ;;
    *)
        echo "Valor incorrecto" 
    ;;
esac