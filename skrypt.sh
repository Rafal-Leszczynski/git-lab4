#!/bin/bash

if [[ "$1" == "--date" ]]; then
  date
else
  echo "Brak lub nieznana flaga"
fi
