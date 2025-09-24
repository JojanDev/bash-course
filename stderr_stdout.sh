#! /bin/bash
 
#Salida en file, errores en errors
ls -12 1> file.txt 2>errors.txt

#Salida y errores en el archivo del parametro 1
ls -12 1> file.txt 2>&1

#Entrada y salida en el archivo file
ls >& file.txt