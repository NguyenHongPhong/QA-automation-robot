*** Settings ***
Library     Browser
Variables   ../../../variables/env_dev.yaml
Variables   ../../../variables/locators.yaml
Variables   ../../../variables/test_data.yaml
Resource    ../../../resources/register.pw.robot


*** Test Cases ***
Register with valid information successfully
    Open And Access New Browser     
    ...     ${BROWSER_FOR_PLAYWRIGHT}
    ...     ${HEADLESS}
    ...     ${WEBSITE_URL}
    Register New User       
    ...     ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     
    ...     ${REGISTER_USERNAME_INPUT}      
    ...     ${REGISTER_EMAIL_INPUT}      
    ...     ${REGISTER_SIGN_UP_BUTTON}		
    ...     ${VALID_USERNAME}	
    ...     ${VALID_EMAIL}
    ${CURRENT_URL_SUCCESS_SIGN_UP}=     Get Url
    Register New User With Addition information
    ...     ${REGISTER_PASSWORD}
    ...     ${VALID_DAY_OF_BIRTH}
    ...     ${VALID_MONTH_OF_BIRTH}
    ...     ${VALID_YEAR_OF_BIRTH}
    ...     ${VALID_FIRST_NAME}
    ...     ${VALID_LAST_NAME}
    ...     ${VALID_COMPANY}
    ...     ${VALID_ADDRESS_1}
    ...     ${VALID_ADDRESS_2}
    ...     ${VALID_COUNTRY}
    ...     ${VALID_STATE}
    ...     ${VALID_CITY}
    ...     ${VALID_ZIP_CODE}
    ...     ${VALID_MOBILE_NUMBER}


           
Register With Invalid Email V3 Should Show Validation Error Message
    Open And Access New Browser     
    ...     ${BROWSER_FOR_PLAYWRIGHT}
    ...     ${HEADLESS}
    ...     ${WEBSITE_URL}
    Register New User       ${HOMEPAGE_REGISTER_AND_LOGIN_LINK}     ${REGISTER_USERNAME_INPUT}      ${REGISTER_EMAIL_INPUT}      ${REGISTER_SIGN_UP_BUTTON}		${VALID_USERNAME}	${INVALID_EMAIL_V3}
    ${error_msg}=       Get Input Validation Message        ${REGISTER_EMAIL_INPUT}
    Should Contain      ${error_msg}        ${INVALID_EMAIL_V3_ERROR_MESSAGE}
