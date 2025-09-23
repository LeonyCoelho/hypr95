#!/bin/bash

# Dependências: socat, jq
# Instale com: sudo pacman -S socat jq

# Loop para ouvir eventos do Hyprland
socat - "UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  # Pega a classe e o título da janela ativa do JSON fornecido pelo hyprctl
  ACTIVE_WINDOW_INFO=$(hyprctl activewindow -j)
  APP_CLASS=$(echo "$ACTIVE_WINDOW_INFO" | jq -r '.class')
  APP_TITLE=$(echo "$ACTIVE_WINDOW_INFO" | jq -r '.title')

  # Se a classe estiver vazia (ex: menus flutuantes), não mostre nada
  if [ -z "$APP_CLASS" ]; then
    printf '{"text": "", "class": "empty"}\n'
    continue
  fi

  # Limita o tamanho do título para não estourar a barra
  if [ "${#APP_TITLE}" -gt 40 ]; then
    APP_TITLE="$(echo "$APP_TITLE" | cut -c 1-40)..."
  fi

  # Saída em JSON para a Waybar. O importante é o campo "class".
  # O texto será o título da janela.
  printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' "$APP_TITLE" "$APP_CLASS" "$(echo "$ACTIVE_WINDOW_INFO" | jq -r '.title')"
done
