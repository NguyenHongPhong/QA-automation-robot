*** Keywords ***
Open And Access Website
    [Arguments]     ${URL}      ${BROWSER}
    Open Browser    ${URL}      ${BROWSER}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Maximize Browser Window

