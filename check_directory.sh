#! /bin/bash

echo "Nombre archivo"
read file

# -d = folder
# -f = files
# if [ -f $file ]
# then 
#     echo "Contenido a agregar:"
#     read content
#     echo $content >> $file
# else 
#     echo "No existe"
# fi

#Leer archivo

# if [ -f $file ]
# then 
#     while IFS= read -r line
#     do
#         echo $line
#     done < $file
# else 
#     echo "No existe"
# fi

#Eliminar 

if [ -f $file ]
then 
    rm $file
    echo "Archivo eliminado"
else 
    echo "No existe"
fi