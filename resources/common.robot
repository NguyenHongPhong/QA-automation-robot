*** Keywords ***
Open And Access Website
    [Arguments]     ${URL}      ${BROWSER}

    Open Browser    ${URL}      ${BROWSER}      options=add_argument(--headless=new);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage);add_argument(--incognito)
    Maximize Browser Window

