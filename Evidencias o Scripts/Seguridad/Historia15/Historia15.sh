curl -c cookie.txt -d "log=JEISIM18@GMAIL.COM&pwd=|wAVKAaeW6&wp-submit=Acceder" https://pascualbravo.ingejei.com/wp-login.php

curl -b cookie.txt https://pascualbravo.ingejei.com/wp-admin/profile.php > perfil.html

curl -i -b cookie.txt \    
-d "_wp_http_referer=%2Fwp-admin%2Fprofile.php&email=correo_invalido%40prueba.com" \
https://pascualbravo.ingejei.com/wp-admin/profile.php \
-o Historia15sintoken.txt


curl -i -L -b cookie.txt \
-d "_wp_http_referer=%2Fwp-admin%2Fprofile.php&email=correo_invalido%40prueba.com" \
https://pascualbravo.ingejei.com/wp-admin/profile.php \
-o Historia15sintoken.txt
