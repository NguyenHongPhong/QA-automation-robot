*** Settings ***
Library     Browser

*** Keywords ***
Open And Access New Browser
    [Arguments]
    ...     ${BROWSER_FOR_PLAYWRIGHT}
    ...     ${HEADLESS}
    ...     ${WEBSITE_URL}
    New Browser     ${BROWSER_FOR_PLAYWRIGHT}      ${HEADLESS}
    New Context
    New Page        ${WEBSITE_URL}
    Wait For Elements State      body    visible     timeout=5s

Register New User
    [Arguments]     
    ...    ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}
    ...    ${REGISTER_USERNAME_INPUT}
    ...    ${REGISTER_EMAIL_INPUT}
    ...    ${REGISTER_SIGN_UP_BUTTON}
    ...    ${REGISTER_VALUE_NAME_INPUT}=None
    ...    ${REGISTER_VALUE_EMAIL_INPUT}=None

    Click    xpath=${HOMEPAGE_REGISTER_AND_LOGIN_LINK}

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

Register New User With Addition information
    [Arguments]
    ...     ${PASSWORD}
    ...     ${DAY_OF_BIRTH}
    ...     ${MONTH_OF_BIRTH}
    ...     ${YEAR_OF_BIRTH}
    ...     ${FIRST_NAME}
    ...     ${LAST_NAME}
    ...     ${COMPANY}
    ...     ${ADDRESS_1}
    ...     ${ADDRESS_2}
    ...     ${COUNTRY}
    ...     ${STATE}
    ...     ${CITY}
    ...     ${ZIP_CODE}
    ...     ${MOBILE_NUMBER}
    Check Checkbox       id=id_gender1     true
    Fill Text       id=password         ${PASSWORD}
    Select Options By    id=days    label    ${DAY_OF_BIRTH}
    Select Options By    id=months  label    ${MONTH_OF_BIRTH}
    Select Options By    id=years   label    ${YEAR_OF_BIRTH}
    Check Checkbox       id=newsletter       true
    Check Checkbox       id=optin      true
    Fill Text       id=first_name       ${FIRST_NAME}
    Fill Text       id=last_name        ${LAST_NAME}
    Fill Text       id=company          ${COMPANY}
    Fill Text       id=address1         ${ADDRESS_1}
    Fill Text       id=address2         ${ADDRESS_2}
    Select Options By      id=country      label        ${COUNTRY}
    Fill Text       id=state        ${STATE}
    Fill Text       id=city         ${CITY}
    Fill Text       id=zipcode      ${ZIP_CODE} 
    FIll Text       id=mobile_number        ${MOBILE_NUMBER}
    Click       css=form[action="/signup"] button[type="submit"]
    ${title}=       Get Text      ${ACCOUNT_CREATED_TITLE_HEADING}
    Should Contain      ${title}        ${SUCCESS_CREATED_ACCOUNT_TITLE}
    Click       ${ACCOUNT_CREATED_CONTINUE_LINK}
    ${user_name}=   Get Text    xpath=${REGISTER_AUTHOR_TEXT}
    Should Contain      ${user_name}        ${VALID_USERNAME}   