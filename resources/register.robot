*** Keywords ***
Register New User
    [Arguments]     ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_PASSWORD_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    Click Link      xpath=${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    Input Text      xpath=${REGISTER_USERNAME_INPUT}        ${VALID_USERNAME}
    Input Text      xpath=${REGISTER_PASSWORD_INPUT}        ${VALID_EMAIL}
    Click Button        xpath=${REGISTER_SIGN_UP_BUTTON}