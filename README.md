# Servidor Day of Defeat Source Tolerância Zero

Este repositório contém os scripts de startup do servidor Day of
Defeat Source Tolerância Zero. São dois scripts a saber:

- Script de startup do servidor
- Script de integração com o systemd

## Por que systemd?

Para que o startup do servidor de jogos ficasse automático, foi
necessário criar a integração ao systemd, que é o gerenciador de
serviços moderno do ambiente linux. 

Assim, quando o sistema operacional entra em execução, o servidor Day
of Defeat Source é automaticamente executado com as credenciais
corretas, integrando-se de forma transparente ao sistema de execução
do linux.

Por ser projetado para executar com credenciais não privilegiadas, o
servidor Day of Defeat Source pode ser melhor controlado pelo systemd.

## Pré-requisitos

Para que seja possível instalar corretamente o servidor Day of Defeat
Source, é necessário que os seguintes passos sejam completados:

- [Instalação do steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD#Linux.2FOS_X)
- Instalação de alguns pacotes de 32 bits para compatibilidade com o
  servidor SRCDS.
- Criação do usuário sem privilégios _steam_ que será o dono dos
  arquivos e da instalação do _steamcmd_.

As instruções de como instalar os pacotes de 32 bit, bem como
configurar e fazer o download dos arquivos do servidor estão descritas
na [documentação de instalação do
steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD#Linux.2FOS_X).

Os scripts foram criados e testados no Ubuntu Linux, versão 20.10 de
64 bits. A princípio devem funcionar em qualquer sistema linux que
suporte o systemd.

## Instalação dos scripts

No diretório [scripts](scripts) estão os scripts necessários para
integrar o SRCDS ao systemd do linux. A estrutura de diretórios em
_scripts_ copia a raiz de uma instalação linux. Assim, os arquivos em
`scripts/etc/systemd/system` devem ser copiados para a instalação
linux em `/etc/systemd/system`.

Analogamente, os arquivos em `scripts/usr/local/sbin` devem ser
copiados para `/usr/local/sbin`.

O script de startup parte da assunção de que o jogo está instalado em
`/usr/local/games/dodtz`.


