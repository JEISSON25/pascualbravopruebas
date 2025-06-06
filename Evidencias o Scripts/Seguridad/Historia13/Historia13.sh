
curl -k -c cookie-cliente.txt \
-d "log=cuentadeprueba32154@gmail.com&pwd=cuentadeprueba&wp-submit=Acceder&redirect_to=https%3A%2F%2Fpascualbravo.ingejei.com%2Fwp-admin%2F&testcookie=1" \
"https://pascualbravo.ingejei.com/wp-login.php"


curl -k -b cookie-cliente.txt -i "https://pascualbravo.ingejei.com/wp-admin/" \
| tee evidencia_roles_cliente.txt
