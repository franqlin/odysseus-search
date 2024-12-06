# Odysseus Search

Odysseus Search é uma ferramenta que permite buscar a presença de um usuário em diversos sites. A ferramenta gera um relatório em formato HTML com os resultados da busca, incluindo um grafo de conexões.

## Funcionalidades

- Busca a presença de um usuário em diversos sites.
- Gera um relatório em formato HTML com os resultados da busca.
- Inclui um grafo de conexões no relatório HTML.


## Pré-requisitos

Certifique-se de que os seguintes pacotes estejam instalados no seu sistema:

- `awk`
- `pandoc`
- `toilet`
- `jq`
- `curl`

## Instalação

1. Clone o repositório:

    ```sh
    git clone <URL_DO_REPOSITORIO>
    cd <NOME_DO_REPOSITORIO>
    ```

2. Execute o script de instalação:

    ```sh
    chmod +x install.sh
    ./install.sh
    ```

    O script de instalação fará o seguinte:
    - Verificará e instalará as dependências necessárias.
    - Criará o diretório de instalação em [odyusersearch](http://_vscodecontentref_/0) se ele não existir.
    - Copiará os arquivos [odyusersearch](http://_vscodecontentref_/1) e [sites.json](http://_vscodecontentref_/2) para o diretório de instalação.
    - Criará um link simbólico em [bin](http://_vscodecontentref_/3) para o arquivo [odyusersearch](http://_vscodecontentref_/4).

## Uso

Para usar a ferramenta, execute o comando [odyusersearch] seguido do nome de usuário que você deseja pesquisar:

```sh
odyusersearch <usuario>