#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello World $N" # if we dont put $N at end the next continue one will be also get the $G colour
echo "Check this colour"