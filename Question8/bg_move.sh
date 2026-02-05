#!/bin/bash

mkdir -p backup

for file in "$1"/*
do
    mv "$file" backup/ &
    echo "Moved $file with PID $!"
done

wait
echo "All background processes completed."
