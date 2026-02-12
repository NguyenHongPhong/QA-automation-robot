*** Keywords ***
Register New User
    [Arguments]     ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    Click Link      xpath=${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    Input Text      ${REGISTER_USERNAME_INPUT}        ${VALID_USERNAME}
    Input Text      ${REGISTER_EMAIL_INPUT}        ${VALID_EMAIL}
    Click Button        ${REGISTER_SIGN_UP_BUTTON}