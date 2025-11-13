#!/bin/bash

#everything in shell is considered as string
NUMBER1=100
NUMBER2=200
NUMBER3=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NUMBER3))

echo " Sum is: ${SUM}"

LEADERS=("Pavan" "Kalyan" "Araveti")

echo "All leaders: ${LEADERS[@]}"
echo "first leader: ${LEADERS[0]}"
echo "second leader: ${LEADERS[1]}"