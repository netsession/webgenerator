#!/bin/bash
# Erstellt ein Web Projekt mit Compass und Git
read -p "Projekt Name:" verzeichnis

pfad=$verzeichnis;

#Ordner und Seitenstruktur
mkdir $pfad
cd $pfad
curl -O https://raw.githubusercontent.com/netsession/webgenerator/master/index.html
mkdir assets
cd assets
curl -O https://raw.githubusercontent.com/netsession/webgenerator/master/config.rb
mkdir fonts css img js scss 
touch scss/style.scss
#Compass
echo '@import "compass/reset";' > scss/style.scss
echo '@import "susy";' >> scss/style.scss

compass init
rm -r css/ie.css css/print.css css/screen.css .sass-cache
rm -r scss/ie.scss scss/print.scss scss/screen.scss
cd ../
#Git
git init
git add .
git commit -m "Initial commit"
