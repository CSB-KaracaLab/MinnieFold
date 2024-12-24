#!/bin/bash

JobName=$1

# Create results directories
mkdir -p results/$JobName
for i in {1..11}; do
  mkdir -p results/$JobName/s$i
done

# Run scenarios
for scenario in {1..11}; do
  echo "Running scenario $scenario..."
  nohup ./scenarios/s${scenario}.sh "$JobName" "$scenario" &> results/$JobName/s${scenario}/s${scenario}.log &
  wait
done

echo "All scenarios completed."

kill
