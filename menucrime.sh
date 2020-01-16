#!/bin/bash
#
# menucrime.sh
# crime, menu script
#
# 16.01.2020 / Dominic Wuethrich, Simon Tschudi
#
# Variablen
TITLE="**** Crime Statistic Menu ****"

# Der Array fuer das Menu
MENU=(
"Dateistruktur Analyse"
"Daten Analyse"
"Häufigstes Verbrechen pro Stadt"
"Beste Stadt in Australien"
"Exit"
)

# Anzahl Elemente des Arrays MENU
ANZAHL=${#MENU[*]}

# Beginn des Programmes
# Schlaufe fuer das Menue
while true; do
  # Menu ausgeben
  echo "$TITLE"
  for ((i=0; $i<$ANZAHL; i=$i+1)); do
    echo "$i) ${MENU[$i]}"
  done

  # Eingabe verlangen und einlesen
  echo -n "Auswahl eingeben, mit ENTER bestaetigen: "
  read ANTWORT
  # case Anweisung - je nach Eingabe Verhalten bestimmen
  case $ANTWORT in
  1) # wenn die Antort 1 ist tue dies
    echo -e "\n=> ${MENU[1]}\n"
    printf Hallo awk -F',' 'NR==1{print NF}' crime.csv
    echo ""
    ;;
  2) # dasselbe fuer die Antwort 2
    echo -e "\n=> ${MENU[2]}\n"
    ./addscript.sh einNeuesSkrip.sh 
    ;;
  3) # dasselbe fuer die Antwort 2
    echo -e "\n=> ${MENU[3]}\n"
    ./addscript.sh einNeuesSkrip.sh 
    ;;
  4) # dasselbe fuer die Antwort 2
    echo -e "\n=> ${MENU[4]}\n"
    ./addscript.sh einNeuesSkrip.sh 
    ;;
  5|[eE]|[qQ]) # regulaerer Ausdruck, behandelt sowohl 2 als auch e/E oder q/Q
    echo -e "\n=> ${MENU[5]}\n"
    break # while Schleife beenden
    ;;
  *) # bei allen anderen Antworten kommt dieser Block zum Zug
    echo -e "\n=> Ungueltige Eingabe\n"
    ;;
  esac
done
