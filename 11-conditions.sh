#!/bin/bash
# -eq equals
# -ne not equals
# -lt lessthan
# -gt greaterthan

echo "Please enter the number"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given number is even"
else
    echo "Given number is odd"
fi
