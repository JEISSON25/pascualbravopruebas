from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

driver = webdriver.Chrome()
driver.get("https://pascualbravo.ingejei.com/wp-login.php?redirect_to=https%3A%2F%2Fpascualbravo.ingejei.com%2Fregistro-y-busqueda%2F")

driver.get("https://pascualbravo.ingejei.com/wp-login.php?redirect_to=https%3A%2F%2Fpascualbravo.ingejei.com%2Fregistro-y-busqueda%2Fhttps://pascualbravo.ingejei.com/wp-login.php?redirect_to=https%3A%2F%2Fpascualbravo.ingejei.com%2Fregistro-y-busqueda%2F")
driver.find_element(By.XPATH, """css=.login""").click()
driver.find_element(By.XPATH, """id=user_login""").send_keys("")
driver.find_element(By.XPATH, """linkText=Registrarse""").click()
driver.find_element(By.XPATH, """id=user_login""").click()
driver.find_element(By.XPATH, """id=user_login""").send_keys("Grup")
driver.find_element(By.XPATH, """id=user_login""").send_keys("Grupp")
driver.find_element(By.XPATH, """id=user_login""").send_keys("Grupo6K")
driver.find_element(By.XPATH, """id=user_email""").click()
driver.find_element(By.XPATH, """id=user_email""").send_keys("karen.valencia127@pascualbravo.edu.co")
driver.find_element(By.XPATH, """id=wp-submit""").click()

driver.quit()
