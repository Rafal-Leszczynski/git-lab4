#!/bin/bash

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
  date

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
  count=100
  if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
    count=$2
  fi
  for ((i=1; i<=count; i++)); do
    filename="log${i}.txt"
    echo "Nazwa pliku: $filename" > "$filename"
    echo "Skrypt: skrypt.sh" >> "$filename"
    echo "Data utworzenia: $(date)" >> "$filename"
  done

elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "  --date, -d           Wyświetla dzisiejszą datę"
  echo "  --logs [n], -l [n]   Tworzy n plików logx.txt (domyślnie 100)"
  echo "  --help, -h           Wyświetla tę pomoc"
  echo "  --init               Klonuje repozytorium i ustawia PATH"
  echo "  --error [n], -e [n]  Tworzy n katalogów errorx z plikami (domyślnie 100)"

elif [[ "$1" == "--init" ]]; then
  REPO_URL="https://github.com/Rafal-Leszczynski/git-lab4"
  git clone "$REPO_URL" .
  export PATH="$PATH:$(pwd)"
  echo "Repozytorium sklonowane i ścieżka ustawiona."

elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
  count=100
  if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
    count=$2
  fi
  for ((i=1; i<=count; i++)); do
    dir="error${i}"
    mkdir -p "$dir"
    echo "Nazwa katalogu: $dir" > "$dir/${dir}.txt"
    echo "Skrypt: skrypt.sh" >> "$dir/${dir}.txt"
    echo "Data utworzenia: $(date)" >> "$dir/${dir}.txt"
  done

else
  echo "Brak lub nieznana flaga"
fi

