#!/bin/bash

# Loop through the range 1 to 100
for i in {1..100}
do
  # Check if the number is divisible by both 3 and 5 but not by 15
  if [[ $((i % 3)) -eq 0 && $((i % 5)) -eq 0 && $((i % 15)) -ne 0 ]] >> output.csv
  then
    # Print the number
    echo $i
  fi
done

