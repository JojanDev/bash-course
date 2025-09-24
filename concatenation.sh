#! /bin/bash

echo "Enter a name: "
read name

echo "Write a adjective"
read adjective

# result="$name is $adjective"
# echo $result

echo ${name,,}
echo ${name^^}

#Convierte a minuscula los caracteres que encuentre que esten dentro de los []
echo ${name,,[AEIOU]}
#Convierte a minuscula los caracteres que encuentre que esten dentro de los []
echo ${name^^[car]}

