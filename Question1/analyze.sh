#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Exactly one argument required."
    exit 1
fi

if [ -f "$1" ]; then
    echo "File detected."
    echo "Lines Words Characters:"
    wc "$1"
elif [ -d "$1" ]; then
    echo "Directory detected."
    echo "Total files: $(find "$1" -type f | wc -l)"
    echo ".txt files: $(find "$1" -type f -name "*.txt" | wc -l)"
else
    echo "Error: Path does not exist."
fi

