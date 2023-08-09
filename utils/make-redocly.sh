#!/bin/bash

echo "Getting started"

# Build docs for any yaml file in the directory "./code/API_definitions" into a zero-dependency HTML file with the same filename
for file in ./code/API_definitions/*.yaml
do
    # Read info.version from the yaml file and use it as the version for the HTML file
    version=$(grep "info:" $file | sed -n 's/\s*version:\s*//p')
    echo "Building $file for version $version"
    npx @redocly/cli build-docs $file -o ./$(basename $file .yaml)_$(version).html
done

echo -e "\nDone!"
