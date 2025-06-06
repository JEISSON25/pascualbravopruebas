from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time

driver = webdriver.Chrome()
driver.set_window_size(697, 703)
driver.get("http://localhost:8000")

driver.get("http://localhost:8000/")
driver.set_window_size(697, 703)
driver.find_element(By.LINKTEXT, "Tienda").click()
driver.find_element(By.NAME, "orderby").click()
select = Select(driver.find_element(By.NAME, "orderby"))
select.select_by_visible_text("Ordenar por precio: bajo a alto")
driver.find_element(By.CSS, ".wc-block-product:nth-child(1) .woocommerce-placeholder").click()
driver.find_element(By.ID, "wp--skip-link--target").click()
driver.find_element(By.CSS, ".wp-block-post-title:nth-child(1)").click()

driver.quit()