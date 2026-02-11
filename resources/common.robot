*** Keywords ***
Open And Access Website
    [Arguments]     ${URL}      ${BROWSER}

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    "--headless=new"
    Call Method    ${options}    add_argument    "--no-sandbox"
    Call Method    ${options}    add_argument    "--disable-dev-shm-usage"
    Call Method    ${options}    add_argument    "--incognito"

    Open Browser    ${URL}      ${BROWSER}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Maximize Browser Window

