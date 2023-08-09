#!/bin/bash

echo "Getting started"

# Build docs for any yaml file in the directory "./code/API_definitions" into a zero-dependency HTML file with the same filename
for file in ./code/API_definitions/*.yaml
do
    echo "Building $file"
    npx @redocly/cli build-docs $file -o ./$(basename $file .yaml).html
done

echo -e "\nDone!"
