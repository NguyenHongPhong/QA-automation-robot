from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By


class RegisterAction:

    def form_submit(self):
        selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
        driver = selenium_lib.driver

        form = driver.find_element(By.CSS_SELECTOR, "form[action='/signup']")
        form.submit()