#!/bin/bash

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

else
  echo "Brak lub nieznana flaga"
fi

