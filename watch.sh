#!/bin/bash

# Message to start process
echo ""
echo "We have started watching your files! Go ahead and make changes"
echo " "
# watch the assets/scss compile css to dist/css

onchange 'assets/scss/*.scss' -- node-sass --output-style expanded --source-map=true  -o dist/css assets/scss  &

# watch the image directory and send to dist/img

onchange 'assets/img/*' -- imagemin assets/img/* --out-dir dist/img
