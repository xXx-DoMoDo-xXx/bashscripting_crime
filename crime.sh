#!/bin/bash
#
# crime.sh
# crime menu script
#
# 11.01.2020 / Dominic Wuethrich, Simon Tschudi, (Beat Maier)
#

# Task 8.1: Funktion: Dateistruktur Analyse
# Anzahl Zeilen zaehlen (useless use of cat!)
cat crime.csv  | wc -l

# This command for count rows is better
wc -l < crime.csv

# Anzahl Spalten zaehlen
awk -F',' 'NR==1{print NF}' crime.csv

# Nur Spaltenbezeichnung anzeigen
awk 'NR==1 {print; exit}' crime.csv

# Funktion: Daten Analyse

# Funktion: Häufigstes Verbrechen pro Stadt

# Funktion: Beste Stadt in Australien
