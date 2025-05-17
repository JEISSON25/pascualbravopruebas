from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

driver = webdriver.Chrome()
driver.get("http://localhost:8000/?post_type=product")

driver.get("http://localhost:8000/?post_type=producthttp://localhost:8000/?post_type=product")
driver.find_element(By.XPATH, """css=.wc-block-product:nth-child(2) .wp-block-button__link > span""").click()
driver.find_element(By.XPATH, """linkText=Tienda""").click()
driver.find_element(By.XPATH, """css=.wc-block-mini-cart__icon""").click()
driver.find_element(By.XPATH, """css=.wc-block-cart-item__quantity:nth-child(5) > .wc-block-cart-item__remove-link""").click()
driver.find_element(By.XPATH, """css=.wc-block-cart-item__quantity:nth-child(4) > .wc-block-cart-item__remove-link""").click()
driver.find_element(By.XPATH, """css=.wc-block-cart-item__remove-link""").click()
driver.find_element(By.XPATH, """css=.wc-block-components-button path""").click()

driver.quit()
