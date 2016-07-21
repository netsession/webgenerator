#!/bin/bash
# Erstellt ein Web Projekt mit Compass und Git
read -p "Projekt Name:" verzeichnis
#Installationsort
read -p "[s]chreibtisch oder [l]ocalhost, Abbruch mit anderen Tasten" kommando 
if [ $kommando == 's' ]; 
then pfad=$HOME'/Schreibtisch/'$verzeichnis
elif [ $kommando == 'l' ];
then pfad=/var/www/html/$verzeichnis;
else exit 0; 
fi
#Ordner und Seitenstruktur
mkdir $pfad
cp config.rb index.html $pfad
cd $pfad
mkdir img js fonts
#Compass
compass init
rm css/ie.css css/print.css scss/ie.scss scss/print.scss
echo "@import \"susy\";" >> scss/screen.scss
Git
git init
git add .
compass watch $pfad
