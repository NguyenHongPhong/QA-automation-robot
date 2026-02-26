*** Settings ***
Library     SeleniumLibrary
*** Keywords ***
Open And Access Website
    [Arguments]     ${URL}      ${BROWSER}

    Open Browser    ${URL}      ${BROWSER}
    Wait Until Page Contains Element        //body      5s      
    Maximize Browser Window

