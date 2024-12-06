#!/bin/bash

# Verifica se o usuário foi passado como parâmetro
if [ -z "$1" ]; then
  echo "Uso: $0 <usuario>"
  exit 1
fi

usuario=$1

# Verifica se o jq está instalado
if ! command -v jq &> /dev/null; then
  echo "jq não está instalado. Instale-o usando 'sudo apt-get install jq'."
  exit 1
fi


# Verifica se o pandoc está instalado
if ! command -v pandoc &> /dev/null; then
  echo "pandoc não está instalado. Instale-o usando 'sudo apt-get install pandoc'."
  exit 1
fi

# Exibe o splash 01screen com ASCII art usando toilet
clear
toilet -f mono12 -F metal "Odysseus Search"
sleep 2

# Cria um arquivo temporário para armazenar os resultados
temp_file=$(mktemp)

# Cores
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# Lê o arquivo sites.json e substitui {} pelo usuário
jq -r 'to_entries[] | "\(.key) \(.value)"' sites.json | while read -r site urlTemplate; do
  url="${urlTemplate//\{\}/$usuario}"
  echo "Verificando $site: $url"
  status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [ "$status_code" -eq 200 ]; then
    echo -e "${GREEN}Usuário encontrado em $site: $url${NC}" | tee -a "$temp_file"
  else
    echo -e "${RED}Usuário não encontrado em $site: $url${NC}" | tee -a "$temp_file"
  fi
done

# Converte o arquivo temporário em uma planilha PDF
awk 'BEGIN {print "| Site | URL | Status |\n|------|-----|--------|"} {print "| " $1 " | " $2 " | " $3 " |"}' "$temp_file" > results.md
pandoc results.md -o results.pdf

# Remove o arquivo temporário
rm "$temp_file" results.md

echo "Relatório gerado: results.pdf"