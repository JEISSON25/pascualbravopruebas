#!/bin/bash

# URL de login y admin
LOGIN_URL="https://pascualbravo.ingejei.com/wp-login.php"
ADMIN_URL="https://pascualbravo.ingejei.com/wp-admin/"

# Función para probar login
probar_login() {
  USER=$1
  PASS=$2
  ROLE=$3

  echo "Probando login para $ROLE: $USER"

  COOKIE_JAR=$(mktemp)
  RESULT_HTML=$(mktemp)

  # Paso 1: Hacer login y guardar cookies
  curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    -e "$LOGIN_URL" \
    -A "Mozilla/5.0" \
    -d "log=$USER" \
    -d "pwd=$PASS" \
    -d "wp-submit=Acceder" \
    -d "redirect_to=$ADMIN_URL" \
    -d "testcookie=1" \
    "$LOGIN_URL" > /dev/null

  # Paso 2: Acceder al admin con las cookies guardadas
  curl -s -L -b "$COOKIE_JAR" -A "Mozilla/5.0" "$ADMIN_URL" > "$RESULT_HTML"

  # Paso 3: Verificar si estamos dentro
  if grep -q "Dashboard" "$RESULT_HTML" || grep -q "wp-admin-bar-my-account" "$RESULT_HTML"; then
    echo "$ROLE: Login exitoso. Acceso al panel de administración confirmado."
  else
    echo "$ROLE: Login fallido o acceso al panel denegado."
  fi

  echo "--------------------------------------------------"
  rm -f "$COOKIE_JAR" "$RESULT_HTML"
}

# Superusuario
probar_login "JEISIM18@GMAIL.COM" "|wAVKAaeW6" "Super Admin"

# Usuario normal
probar_login "juan.benjumea316@pascualbravo.edu.co" "empanadaconaji04" "Usuario Normal"

