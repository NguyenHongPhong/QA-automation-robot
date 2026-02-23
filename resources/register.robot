*** Keywords ***
Register New User
    [Arguments]     ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    Click Link      xpath=${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    Input Text      ${REGISTER_USERNAME_INPUT}        ${VALID_USERNAME}
    Input Text      ${REGISTER_EMAIL_INPUT}        ${VALID_EMAIL}
    Click Button        ${REGISTER_SIGN_UP_BUTTON}

Register New User With Empty Name
    [Arguments]     ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}
    Click Link      xpath=${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    Input Text      ${REGISTER_USERNAME_INPUT}        ${EMPTY_USERNAME}
    Input Text      ${REGISTER_EMAIL_INPUT}        ${VALID_EMAIL}
    Click Button        ${REGISTER_SIGN_UP_BUTTON}

Get Input Validation Message 
    [Arguments]     ${LOCATOR_NAME}

    ${msg}=     Get Element Attribute       xpath=${LOCATOR_NAME}      validationMessage
    [Return]        ${msg}