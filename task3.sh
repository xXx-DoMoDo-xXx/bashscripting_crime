#!/bin/bash
  for i in {3..10}; do
    echo "Haeufigste Verbrechen in $(awk -F, "{print \$$i}" crime.csv | head -1): $(sort -k$i -t, -r -n crime.csv | head -1 | awk -F, "{print \$1, \$$i}")"
  done
