#!/bin/bash

# Run it from a newly created subdirectory

if [ -f ./CMakeLists.txt ] || [ -f ./${PWD##*/}.cpp ]; then
    echo "Directory must be emply!"
    exit 1
fi

sed "s/Template/${PWD##*/}/g" ../Template/CMakeLists.txt > ./CMakeLists.txt
if [ -f ./LICENSE ]; then
    echo "/*" > ./${PWD##*/}.cpp
    while IFS= read -r line
    do
        if [ -z "$line" ]; then
            echo " *" >> ./${PWD##*/}.cpp
        else
            echo " * $line" >> ./${PWD##*/}.cpp
        fi
    done < ./LICENSE
    echo " */" >> ./${PWD##*/}.cpp
fi
cat ../Template/Template.cpp >> ./${PWD##*/}.cpp
