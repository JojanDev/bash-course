#! /bin/bash

for i in {0..9}
do
  echo $i
  if [ $i -eq 5 ]
  then
    break
  fi
done