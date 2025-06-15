#!/bin/bash

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                          FranCILDO Alves                                      ##
##                                   Github: francildoalves                                    ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

# Cores
amarelo="\e[33m"
branco="\e[97m"
verde="\e[32m"
vermelho="\e[91m"
reset="\e[0m"

# Função para exibir uma barra de progresso simples (apenas para ilustração)
show_progress_bar() {
    local duration=$1
    local message="$2"
    local pbar_length=50 # Comprimento da barra de progresso
    local step_sleep_time=0.05 # Tempo entre cada caractere da barra

    echo -ne "$message "
    for ((i=0; i<pbar_length; i++)); do
        echo -ne "$verde#$reset"
        sleep $step_sleep_time
    done
    echo -e " Concluído!\n"
}

clear
echo ""
echo -e "$amarelo===================================================================================================$reset"
echo -e "$amarelo=                                                                                                 $amarelo=$reset"
echo -e "$amarelo=                     $branco  █████╗     ██╗   ██╗    ██╗    ███████╗     ██████╗                       $amarelo=$reset"
echo -e "$amarelo=                     $branco ██╔══██╗    ██║   ██║    ██║    ██╔════╝    ██╔═══██╗                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ███████║    ██║   ██║    ██║    ███████╗    ██║   ██║                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ██╔══██║    ╚██╗ ██╔╝    ██║    ╚════██║    ██║   ██║                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ██║  ██║     ╚████╔╝     ██║    ███████║    ╚██████╔╝                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ╚═╝  ╚═╝      ╚═══╝      ╚═╝    ╚══════╝     ╚═════╝                       $amarelo=$reset"
echo -e "$amarelo=                                                                                                 $amarelo=$reset"
echo -e "$amarelo===================================================================================================$reset"
echo ""
echo ""

echo -e "$vermelho==============================================================$reset"
echo -e "$vermelho=                 $branco ATENÇÃO: ESTE SCRIPT IRÁ REMOVER     $vermelho=$reset"
echo -e "$vermelho=               $branco DIRETÓRIOS, GRUPOS E USUÁRIOS!         $vermelho=$reset"
echo -e "$vermelho==============================================================$reset"
echo ""
read -p "Tem certeza que deseja continuar? (s/N): " confirmacao
echo ""

if [[ ! "$confirmacao" =~ ^[Ss]$ ]]; then
    echo -e "$amarelo Operação cancelada. $reset"
    exit 0
fi

# Lista de usuários, grupos e diretórios para remover
USERS=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")
GROUPS=("GRP_ADM" "GRP_VEN" "GRP_SEC")
DIRECTORIES=("/publico" "/adm" "/ven" "/sec")

# 1. Remover usuários
echo "Iniciando remoção de usuários..."
show_progress_bar 20 "Removendo usuários..."
for user in "${USERS[@]}"; do
    if id "$user" &>/dev/null; then # Verifica se o usuário existe
        echo -e "  Removendo usuário: $branco$user$reset"
        userdel -r "$user" # -r remove o diretório home e o spool de e-mail do usuário
    else
        echo -e "  Usuário $branco$user$reset $amarelo já removido ou não existe.$reset"
    fi
done
echo "Verificação e remoção de usuários concluída!"
echo ""

# 2. Remover grupos
echo "Iniciando remoção de grupos..."
show_progress_bar 15 "Removendo grupos..."
for group in "${GROUPS[@]}"; do
    if getent group "$group" &>/dev/null; then # Verifica se o grupo existe
        echo -e "Removendo grupo: $branco$group$reset"
        groupdel "$group"
    else
        echo -e "  Grupo $branco$group$reset $amarelo já removido ou não existe.$reset"
    fi
done
echo "Verificação e remoção de grupos concluída!"
echo ""

# 3. Remover diretórios
echo "Iniciando remoção de diretórios..."
show_progress_bar 10 "Removendo diretórios..."
for dir in "${DIRECTORIES[@]}"; do
    if [ -d "$dir" ]; then # Verifica se o diretório existe
        echo -e "  Removendo diretório: $branco$dir$reset"
        rm -rf "$dir" # -r remove recursivamente, -f força a remoção sem prompt
    else
        echo -e "  Diretório $branco$dir$reset $amarelo já removido ou não existe.$reset"
    fi
done
echo "Verificação e remoção de diretórios concluída!"
echo ""

echo -e "$verde==============================================================$reset"
echo -e "$verde=                 $branco SCRIPT DE LIMPEZA FINALIZADO!       $verde=$reset"
echo -e "$verde==============================================================$reset"
echo ""
echo "Todas as ações do script anterior foram desfeitas, se existiam."
echo ""
