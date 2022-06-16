from selenium import webdriver

USERNAME = 'DEMO'
PASSWORD = 'DEMO'

driver = webdriver.Chrome('chromedriver.exe')
driver.get('https://flxptovta.flexxus.com.ar/signin')

driver.implicitly_wait(2)

driver.get('https://flxptovta.flexxus.com.ar/signin')

config = driver.find_elemt_by_class('ssl')
config.click()
config.click()

user_input = driver.find_element_by_xpath('/html[1]/body[1]/div[1]/div[1]/div[1]/form[1]/div[1]/div[2]/div[1]/div[1]/span[1]/input[1]')
user_input.send_keys(USERNAME)

password_input = driver.find_element_by_xpath('/html[1]/body[1]/div[1]/div[1]/div[1]/form[1]/div[2]/div[2]/div[1]/div[1]/span[1]/input[1]')
password_input.send_keys(PASSWORD)

sign_in_button = driver.find_element_by_class_name('/html[1]/body[1]/div[1]/div[1]/div[1]/form[1]/div[4]/div[1]/div[1]/div[1]/button[1]/span[1]')
sign_in_button.click()
sign_in_button.click()
