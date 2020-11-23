#!/bin/bash

function compile {
   node-sass --output-style expanded --source-map=true  -o assets/css assets/scss 
}


function imageTask {
    imagemin assets/img/* --out-dir dist/img
}


function move-js-css {
    cp assets/js/*.min.js  dist/js/
    cp assets/css/*  dist/css/
  
}

function minify {
    postcss assets/css/style.css --use=autoprefixer --map=false --output=assets/css/style.css
    cleancss --level=1 --source-map --source-map-inline-sources --output assets/css/style.min.css assets/css/style.css
}

function move-min-css {
    cp assets/css/style.min.*  dist/css/
}
# call the functions

compile
imageTask
move-js-css
minify 
move-min-css 

