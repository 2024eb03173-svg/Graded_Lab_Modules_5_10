#!/bin/bash
# Assuming marks.txt format: Roll,Name,M1,M2,M3
FAIL_ONE=0
PASS_ALL=0

while IFS=',' read -r roll name m1 m2 m3; do
    fail_count=0
    (( m1 < 33 )) && ((fail_count++))
    (( m2 < 33 )) && ((fail_count++))
    (( m3 < 33 )) && ((fail_count++))

    if [ $fail_count -eq 1 ]; then
        echo "Failed in one: $name ($roll)"
        ((FAIL_ONE++))
    elif [ $fail_count -eq 0 ]; then
        echo "Passed all: $name ($roll)"
        ((PASS_ALL++))
    fi
done < marks.txt

echo "Summary: Failed in one = $FAIL_ONE, Passed all = $PASS_ALL"
