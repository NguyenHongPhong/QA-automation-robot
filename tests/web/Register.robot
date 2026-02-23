*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/common.robot
Variables    ../../variables/env_dev.yaml
Variables    ../../variables/locators.yaml
Resource    ../../resources/register.robot

*** Test Cases ***
Register With Valid Credentials Should Navigate Sign Up Page
    Open And Access Website     ${WEBSITE_URL}      ${BROWSER}
    Register New User       ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    Wait Until Page Contains Element        //body      5s
    ${current_url}=     Get Location
    Should Be Equal     ${current_url}      ${REGISTER_SUCCESS_REDIRECT_LINK}

Register With Empty Name Field Should Show Validation Error Message
    Open And Access Website     ${WEBSITE_URL}      ${BROWSER}
    Register New User With Empty Name      ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}     ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    ${validation_message}=    Get Input Validation Message        ${REGISTER_USERNAME_INPUT}
    Should Be Equal     ${validation_message}       ${EMPTY_NAME_VALIDATION_MESSAGE}
