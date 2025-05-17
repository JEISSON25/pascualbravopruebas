
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time

# Configura el navegador
driver = webdriver.Chrome()
driver.set_window_size(697, 703)

# Abre la URL
driver.get("http://localhost:8000/wp-admin/user-new.php")

# Rellenar campos del formulario
driver.find_element(By.ID, "user_login").click()
driver.find_element(By.ID, "user_login").send_keys("Felipe")

driver.find_element(By.ID, "email").click()
driver.find_element(By.ID, "email").clear()
driver.find_element(By.ID, "email").send_keys("Felipe123@gmail.com")

driver.find_element(By.ID, "first_name").click()
driver.find_element(By.ID, "first_name").send_keys("Felipe")

driver.find_element(By.ID, "last_name").click()
driver.find_element(By.ID, "last_name").send_keys("Pasos")

# Seleccionar idioma
select = Select(driver.find_element(By.ID, "locale"))
select.select_by_visible_text("Español de Colombia")

# Generar contraseña
driver.find_element(By.CSS_SELECTOR, ".wp-generate-pw").click()

# Hacer clic en "Añadir nuevo usuario"
driver.find_element(By.ID, "createusersub").click()

# Verificar si el texto de confirmación aparece (opcional)
time.sleep(2)
assert "Nuevo usuario creado" in driver.page_source

# Cierra el navegador
driver.quit()
