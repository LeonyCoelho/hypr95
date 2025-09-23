#!/bin/bash

# Obtém o ID do workspace ativo
active_ws=$(hyprctl activeworkspace -j | jq '.id')

# Obtém a lista de workspaces e formata
workspaces=$(hyprctl workspaces -j | jq -c 'sort_by(.id) | .[] | .id')

output=""
for ws in $workspaces; do
  if [ "$ws" == "$active_ws" ]; then
    # Formato para o workspace ATIVO
    output+="%{B#000080}%{F#FFFFFF} $ws %{F-}%{B-}"
  else
    # Formato para workspaces inativos
    output+=" $ws "
  fi
done

# Imprime a string final para o genmon
echo -e "$output"
