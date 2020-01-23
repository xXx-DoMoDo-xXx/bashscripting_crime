#!/bin/bash
#
# menucrime.sh
# crime, menu script
#
# 23.01.2020 / Dominic Wuethrich, Simon Tschudi
#
# Variablen
TITLE="**** Crime Statistic Menu ****"

# Der Array fuer das Menu
MENU=(
"Data structur analysis"
"Data analysis"
"Most crime in this city"
"Most crime in this city (faster solution)"
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
  0) # wenn die Antort 1 ist tue dies
    echo -e "\n=> ${MENU[0]}\n"
    # Textausgabe und Anzahl Zeilen ausgeben
    echo "Anzahl Zeilen: $(wc -l < crime.csv)"
    # Textausgabe und alle Spaltenbezeichnungen auflisten
    echo "Spaltenbezeichnungen: $(awk 'NR==1{print; exit}' crime.csv)" # ToDo untereinandere auflisten anstatt nebenander!
    echo""
    ;;
  1) # dasselbe fuer die Antwort 2
    echo -e "\n=> ${MENU[1]}\n"
    # Ausgabe Verbrechen und die jeweiligen Häufigkeit (Total)
    awk -F, '{print $1, $NF;}' crime.csv
    echo
    ;;
  2) # dasselbe fuer die Antwort 3
    echo -e "\n=> ${MENU[2]}\n"
    # Ausgabe Meiste Verbrechen in den jeweiligen Städten
      for i in {3..10}; do
        echo "Most crimes in $(awk -F, "{print \$$i}" crime.csv | head -1): $(sort -k$i -t, -r -n crime.csv | head -1 | awk -F, "{print \$1, \$$i}")"
      done
    echo""
    ;;
  3) # dasselbe fuer die Antwort 3
    echo -e "\n=> ${MENU[3]}\n"
    # Ausgabe Meiste Verbrechen in den jeweiligen Städten (führt schneller aus, Lösung erhalten von einem Arbeitskolleg)
      ./cr2.awk < crime.csv
    echo""
    ;;
  4|[eE]|[qQ]) # regulaerer Ausdruck, behandelt sowohl 5 als auch e/E oder q/Q
    echo -e "\n=> ${MENU[4]}\n"
    break # while Schleife beenden
    ;;
  *) # bei allen anderen Antworten kommt dieser Block zum Zug
    echo -e "\n=> Ungueltige Eingabe\n"
    ;;
  esac
done


