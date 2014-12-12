#!/bin/bash

# Create dist folder
mkdir -p dist

for DIR in `ls -d *cbig*/`
do
	echo "Zipping package $DIR..."
	zip -r "dist/$(basename $DIR).zip" $DIR -x "*/.directory" "*/.Rhistory" "*/*.Rproj*" "*/*sublime*"
done
