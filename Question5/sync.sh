#!/bin/bash

echo "Only in dirA:"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo "Only in dirB:"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo "Common files comparison:"
for file in $(ls dirA)
do
    if [ -f dirB/$file ]; then
        cmp dirA/$file dirB/$file && echo "$file matches"
    fi
done
