#!/bin/bash

if [[ "$1" == "--logs" && -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
  count=$2
  for ((i=1; i<=count; i++)); do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Skrypt: skrypt.sh" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done
else
  echo "Ta gałąź implementuje tylko --logs <liczba>"
fi

