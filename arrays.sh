#! /bin/bash

names=("Name1" "Name2" "Name3")

#Imprime todos los elementos
# echo ${names[*]}
# echo ${names[@]}

# echo "first item: ${names[0]}"

# echo "Index: ${!names[@]}"
# echo "Total index: ${#names[@]}"

#Recorrer la lista
for name in ${names[@]}
do
    echo $name
done

#Eliminar
# unset names[0]

#Agregar al final
# names[${#names[@]}]="Ultimo"
names+=("Ultimo")

echo ${names[*]}

#Editar
names[2]="Modificado"
