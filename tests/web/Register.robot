*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/common.robot
Variables    ../../variables/env_dev.yaml
Variables    ../../variables/locators.yaml
Resource    ../../resources/register.robot

*** Test Cases ***
Register With Valid Credentials Should Navigate Sign Up Page
    Open And Access Website     ${WEBSITE_URL}      ${BROWSER}
    Register New User       ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_PASSWORD_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    ${current_url}=     Get Location
    Should Be Equal     ${current_url}      ${REGISTER_SUCCESS_REDIRECT_LINK}