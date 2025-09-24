#! /bin/bash

names=("Juan" "Johan" "Juli")

function hello() {
    local message="Hello world $1"
    echo $message
}

# hello "Juan"
set -x
for name in ${names[@]}
do
    hello $name
done    
set +x