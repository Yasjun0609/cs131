#!/bin/bash

# Set the delimiter to newline
IFS=$'\n'

# Input file containing YouTube data
input_file="Global YouTube Statistics.csv"

# Loop through lines in the input file
for line in $(cat "$input_file"); do
  # Set the delimiter to comma
  IFS=','
  
  # Split the line into fields and store them in an array
  fields=($line)
  
  # Check if the 8th column contains "United States"
  if [ "${fields[7]}" == "United States" ]; then
    # Check the 5th column for different categories
    if [ "${fields[4]}" == "Entertainment" ]; then
      # Append the line to Entertainment.txt
      echo "$line" >> "United_States/Entertainment.txt"
    elif [ "${fields[4]}" == "Music" ]; then
      # Append the line to Music.txt
      echo "$line" >> "United_States/Music.txt"
    elif [ "${fields[4]}" == "Gaming" ]; then
      # Append the line to Gaming.txt
      echo "$line" >> "United_States/Gaming.txt"
    elif [ "${fields[4]}" == "Comedy" ]; then
      # Append the line to Comedy.txt
      echo "$line" >> "United_States/Comedy.txt"
    fi
  fi
done

