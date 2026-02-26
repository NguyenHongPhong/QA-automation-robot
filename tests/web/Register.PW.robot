*** Settings ***
Library     Browser
Variables    ../../variables/env_dev.yaml
Variables    ../../variables/locators.yaml
Variables    ../../variables/test_data.yaml
Resource    ../../resources/register.pw.robot


*** Test Cases ***
Register With Invalid Email V3 Should Show Validation Error Message
    New Browser     ${BROWSER_FOR_PLAYWRIGHT}      headless=False
    New Context
    New Page        ${WEBSITE_URL}
    Wait For Elements State      body    visible     timeout=5s
    Register New User       ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}		${VALID_USERNAME}	${INVALID_EMAIL_V3}
    ${error_msg}=       Get Input Validation Message        ${REGISTER_EMAIL_INPUT}
    Should Contain      ${error_msg}        ${INVALID_EMAIL_V3_ERROR_MESSAGE}
