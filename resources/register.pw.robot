*** Keywords ***
Register New User
    [Arguments]     
    ...    ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    ...    ${REGISTER_USERNAME_INPUT}
    ...    ${REGISTER_EMAIL_INPUT}
    ...    ${REGISTER_SIGN_UP_BUTTON}
    ...    ${REGISTER_VALUE_NAME_INPUT}=None
    ...    ${REGISTER_VALUE_EMAIL_INPUT}=None

    Click    ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}

    IF    '${REGISTER_VALUE_NAME_INPUT}' != 'None'
        Fill Text    ${REGISTER_USERNAME_INPUT}    ${REGISTER_VALUE_NAME_INPUT}
    END

    IF    '${REGISTER_VALUE_EMAIL_INPUT}' != 'None'
        Fill Text    ${REGISTER_EMAIL_INPUT}    ${REGISTER_VALUE_EMAIL_INPUT}
    END

    Click    ${REGISTER_SIGN_UP_BUTTON}

Get Input Validation Message
    [Arguments]     ${LOCATOR_NAME}

    ${msg}=    Get Property    ${LOCATOR_NAME}    validationMessage
    RETURN     ${msg}