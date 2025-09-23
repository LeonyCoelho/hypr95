#!/bin/bash

# Define o prompt que aparecerá no Rofi
PROMPT="Search File or Directory"

# Executa o plocate e joga a lista para o Rofi, AGORA com o nosso tema Chicago95
SELECTION=$(plocate --existing "$HOME" | rofi -dmenu -i -p "$PROMPT" -theme "$HOME/.config/rofi/chicago95.rasi")

# Se o usuário pressionou ESC ou não selecionou nada, a variável SELECTION estará vazia.
# Neste caso, o script simplesmente termina.
if [ -z "$SELECTION" ]; then
  exit 0
fi

# Se um arquivo foi selecionado, usa xdg-open para abri-lo com o aplicativo padrão.
# O comando "nohup" e o "&" garantem que o arquivo abra em segundo plano,
# liberando o terminal (e o Rofi) imediatamente.
nohup xdg-open "$SELECTION" &>/dev/null &
