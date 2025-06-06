#!/bin/bash

LOGIN_URL="https://pascualbravo.ingejei.com/wp-login.php"
ACCOUNT_URL="https://pascualbravo.ingejei.com/my-account/"
EDIT_URL="https://pascualbravo.ingejei.com/my-account/edit-account/"

USER="juan.benjumea316@pascualbravo.edu.co"
PASS="empanadaconaji04"

echo "Iniciando sesión..."
curl -s -L -c cookies.txt -b cookies.txt \
  -e "$LOGIN_URL" \
  -A "Mozilla/5.0" \
  -d "log=$USER" \
  -d "pwd=$PASS" \
  -d "wp-submit=Acceder" \
  -d "redirect_to=$ACCOUNT_URL" \
  -d "testcookie=1" \
  "$LOGIN_URL" > /dev/null

echo "Accediendo al formulario de edición..."
HTML=$(curl -s -L -b cookies.txt -A "Mozilla/5.0" "$EDIT_URL")

# Buscar cualquier nonce en el HTML
NONCE_NAME=$(echo "$HTML" | grep -oP 'name="\K[^"]+nonce[^"]*' | head -n 1)
NONCE_VALUE=$(echo "$HTML" | grep -oP 'name="'$NONCE_NAME'" value="\K[^"]+' | head -n 1)

if [[ -z "$NONCE_NAME" || -z "$NONCE_VALUE" ]]; then
  echo "No se encontró ningún token CSRF (nonce)."
  echo "$HTML" | grep -i nonce | head -n 10
  exit 1
fi

echo "Token CSRF encontrado: $NONCE_NAME = $NONCE_VALUE"

# Simular envío con y sin token
echo "Enviando formulario CON token..."
RESPONSE_VALID=$(curl -s -L -b cookies.txt -A "Mozilla/5.0" \
  -d "account_first_name=Juan" \
  -d "account_last_name=PruebaCSRF" \
  -d "$NONCE_NAME=$NONCE_VALUE" \
  -d "save_account_details=Guardar cambios" \
  "$EDIT_URL")

echo "Enviando formulario SIN token..."
RESPONSE_INVALID=$(curl -s -L -b cookies.txt -A "Mozilla/5.0" \
  -d "account_first_name=Juan" \
  -d "account_last_name=CSRF-Test" \
  -d "save_account_details=Guardar cambios" \
  "$EDIT_URL")

# Resultados
echo
if echo "$RESPONSE_VALID" | grep -qi "guardados" || echo "$RESPONSE_VALID" | grep -qi "saved"; then
  echo "Con token: Cambios aplicados correctamente."
else
  echo "Con token: No se aplicaron los cambios."
fi

if echo "$RESPONSE_INVALID" | grep -qi "error" || echo "$RESPONSE_INVALID" | grep -qi "nonce"; then
  echo "Sin token: Protección CSRF activa. Cambios rechazados."
else
  echo "Sin token: ¡Peligro! Cambios aceptados sin token CSRF."
fi

rm -f cookies.txt

