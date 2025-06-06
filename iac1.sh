#!/bin/bash

## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##
##                                        FranCILDO Alves                                      ##
##                                    Github: francildoalves                                   ##
## // ## // ## // ## // ## // ## // ## // ## //## // ## // ## // ## // ## // ## // ## // ## // ##

# Cores
amarelo="\e[33m"
verde="\e[32m"
branco="\e[97m"
bege="\e[93m"
vermelho="\e[91m"
reset="\e[0m"


# Função para exibir a mensagem Infraestrutura como Código (IaC)
mensagem_iac(){
    echo ""
    echo -e "$amarelo===================================================================================================================================$reset"
    echo -e "$amarelo=                                                                                                                                 $amarelo=$reset"
    echo -e "$amarelo=       $branco ██╗███╗   ██╗███████╗██████╗  █████╗ ███████╗████████╗██████╗ ██╗   ██╗ ██████╗████████╗██╗   ██╗██████╗ ███████╗        $amarelo=$reset"
    echo -e "$amarelo=       $branco ██║████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔════╝        $amarelo=$reset"
    echo -e "$amarelo=       $branco ██║██╔██╗ ██║█████╗  ██████╔╝███████║███████╗   ██║   ██████╔╝██║   ██║██║        ██║   ██║   ██║██████╔╝█████╗          $amarelo=$reset"
    echo -e "$amarelo=       $branco ██║██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║██║        ██║   ██║   ██║██╔══██╗██╔══╝          $amarelo=$reset"
    echo -e "$amarelo=       $branco ██║██║ ╚████║██║     ██║  ██║██║  ██║███████║   ██║   ██║  ██║╚██████╔╝╚██████╗   ██║   ╚██████╔╝██║  ██║███████╗        $amarelo=$reset"
    echo -e "$amarelo=       $branco ╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝        $amarelo=$reset"
    echo -e "$amarelo=       $branco                                                                                                                          $amarelo=$reset" 
    echo -e "$amarelo=       $branco                             █████╗ ███████╗     ██████╗ ██████╗ ██████╗ ███████╗                                         $amarelo=$reset"
    echo -e "$amarelo=       $branco                            ██╔══██╗██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝                                         $amarelo=$reset"
    echo -e "$amarelo=       $branco                            ███████║███████╗    ██║     ██║   ██║██║  ██║█████╗                                           $amarelo=$reset"
    echo -e "$amarelo=       $branco                            ██╔══██║╚════██║    ██║     ██║   ██║██║  ██║██╔══╝                                           $amarelo=$reset"
    echo -e "$amarelo=       $branco                            ██║  ██║███████║    ╚██████╗╚██████╔╝██████╔╝███████╗                                         $amarelo=$reset"
    echo -e "$amarelo=       $branco                            ╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                                         $amarelo=$reset"
    echo -e "$amarelo=                                                                                                                 v. 1.0.0        $amarelo=$reset"
    echo -e "$amarelo===================================================================================================================================$reset"
    echo -e "$amarelo=                                                                                                                                 $amarelo=$reset"
    echo -e "$amarelo=                                           ${branco}Este script irá configurar seu ambiente.${amarelo}                                              $amarelo=$reset"
    echo -e "$amarelo=                                         ${branco}Serão criados usuários, grupos e diretórios.${amarelo}                                            $amarelo=$reset"
    echo -e "$amarelo=                                                                                                                                 $amarelo=$reset"
    echo -e "$amarelo===================================================================================================================================$reset"
    echo ""
}

# Função para exibir a mensagem de instruções/permissões
mensagem_descicao(){
    echo ""
    echo ""
    echo -e "$verde Regras aplicadas neste Script:$reset"
    echo ""
    echo -e "$branco * O dono de todos os diretórios criados será o usuário $verde'root'$branco.$reset"
    echo -e "$branco * Todos os usuários terão permissão total (leitura, escrita e execução) dentro do diretório $verde'/publico'$branco.$reset"
    echo -e "$branco * Os usuários de cada grupo (ex: GRP_ADM) terão permissão total dentro de seu respectivo diretório $verde(ex: /adm)$branco.$reset"
    echo -e "$branco * Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem.$reset"
    echo ""
    echo -e "$amarelo===================================================================================================================================$reset"
    echo ""
    read -n 1 -s -r -p "Pressione qualquer tecla para continuar..." 
    echo ""
}

# No início do script. Chama as funções com o banner e regras gerais do script.
mensagem_iac
mensagem_descicao

#Cria diretórios
echo "Iniciando a criação de diretórios..."
show_progress_bar 10 "Criando diretórios..." # Chama a barra de progresso
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec
#echo "Diretórios criados com sucesso!" # Mensagem da barra já indica conclusão

#Cria grupos de usuários
echo "Iniciando a criação de grupos de usuários..."
show_progress_bar 10 "Criando grupos..." # Chama a barra de progresso
groupadd GRP_ADM 2>/dev/null
groupadd GRP_VEN 2>/dev/null
groupadd GRP_SEC 2>/dev/null
#echo "Grupos criados com sucesso!"

#Cria usuários e atribui grupos
echo "Iniciando a criação dos usuários do sistema..."
show_progress_bar 20 "Criando usuários..." # Duração maior para mais usuários
#Usuários do grupo GRP_ADM
useradd carlos -c "Carlos" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_ADM 2>/dev/null
useradd maria -c "Maria" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_ADM 2>/dev/null
useradd joao -c "João" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_ADM 2>/dev/null

#Usuários do grupo GRP_VEN
useradd debora -c "Débora" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_VEN 2>/dev/null
useradd sebastiana -c "Sebastiana" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_VEN 2>/dev/null
useradd roberto -c "Roberto" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_VEN 2>/dev/null

#Usuários do grupo GRP_SEC
useradd josefina -c "Josefina" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_SEC 2>/dev/null
useradd amanda -c "Amanda" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_SEC 2>/dev/null
useradd rogerio -c "Rogério" -s /bin/bash -m -p "$(openssl passwd -6 'Senha@123')" -G GRP_SEC 2>/dev/null
#echo "Usuários criados com sucesso!"

# Atribui permissões aos diretórios
echo "Iniciando atribuição de permissões aos diretórios..."
show_progress_bar 10 "Atribuindo permissões..." # Chama a barra de progresso
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico
#echo "Permissões atribuídas com sucesso!"

echo ""
echo -e "$verde===================================================================================================================================$reset"
echo -e "$verde=                                                  Script finalizado com sucesso!                                                 $verde=$reset"
echo -e "$verde===================================================================================================================================$reset"
echo ""