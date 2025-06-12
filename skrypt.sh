#!/bin/bash

if [[ "$1" == "--date" ]]; then
  date

elif [[ "$1" == "--logs" ]]; then
  count=100  # domyślnie 100 plików
  if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
    count=$2
  fi

  for ((i=1; i<=count; i++)); do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Skrypt: skrypt.sh" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done

elif [[ "$1" == "--help" ]]; then
  echo "Dostępne opcje:"
  echo "  --date        Wyświetla dzisiejszą datę"
  echo "  --logs [n]    Tworzy n plików logx.txt (domyślnie 100)"
  echo "  --help        Wyświetla tę pomoc"

else
  echo "Brak lub nieznana flaga"
fi

