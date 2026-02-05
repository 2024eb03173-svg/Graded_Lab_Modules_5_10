#!/bin/bash

words=$(tr -c '[:alpha:]' '\n' < input.txt | tr 'A-Z' 'a-z')

echo "$words" | grep -E '^[aeiou]+$' > vowels.txt
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz]+$' > consonants.txt
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz].*[aeiou].*' > mixed.txt
