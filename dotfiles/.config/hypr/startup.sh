#!/bin/bash

# Espera 1 segundo para garantir que o ambiente esteja pronto
sleep 1

# Aplica as configurações GTK
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Mauve-dark"
gsettings set org.gnome.desktop.interface icon-theme "Catppuccin-Macchiato-Mauve"
gsettings set org.gnome.desktop.interface cursor-theme "Catppuccin-Macchiato-Mauve-Cursors"

xfconf-query -c xsettings -p /Net/ThemeName -s "Catppuccin-Macchiato-Standard-Mauve-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Catppuccin-Macchiato-Mauve"
xfconf-query -c xsettings -p /Net/CursorThemeName -s "Catppuccin-Macchiato-Mauve-Cursors"
