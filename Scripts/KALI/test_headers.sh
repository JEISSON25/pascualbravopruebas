#!/bin/bash

URL="https://pascualbravo.ingejei.com"

echo "Revisando encabezados HTTP de seguridad en: $URL"
curl -s -I "$URL" | grep -iE "content-security-policy|strict-transport-security|x-frame-options|x-content-type-options"
