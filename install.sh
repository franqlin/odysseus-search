#!/bin/bash

# Verifica e instala dependências
DEPENDENCIAS=("awk" "pandoc" "toilet" "jq" "curl")

for DEP in "${DEPENDENCIAS[@]}"; do
    if ! command -v $DEP &> /dev/null; then
        echo "Dependência $DEP não encontrada. Instalando..."
        sudo apt-get update
        sudo apt-get install -y $DEP
    else
        echo "Dependência $DEP já está instalada."
    fi
done

# Cria o diretório de instalação em /opt/odyusersearch se não existir
install_dir="/opt/odyusersearch"
if [ ! -d "$install_dir" ]; then
    sudo mkdir -p "$install_dir"
    echo "Diretório $install_dir criado."
fi

# Copia os arquivos para o diretório de instalação
sudo cp odyusersearch "$install_dir/odyusersearch"
sudo cp sites.json "$install_dir/sites.json"
sudo chmod +x "$install_dir/odyusersearch"

# Cria um link simbólico em /usr/bin
sudo ln -sf "$install_dir/odyusersearch" /usr/bin/odyusersearch

echo "Instalação concluída. Você pode executar o script com o comando 'odyusersearch'."