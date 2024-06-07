*** Settings ***
Library     SeleniumLibrary




*** Variables ***
${URL}      https://www.saucedemo.com/
${BROWSER}      Chrome
${OPTIONS}       
${REMOTE_URL}  ${EMPTY}


*** Keywords ***
Open my Browser in chrome
    Open Browser     ${URL}    headlesschrome 
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Open my Browser in firefox
    Open Browser     ${URL}    headlessfirefox 
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browsers
    Close All Browsers

Open Login Page
    Go To    ${URL}

Input username
    [Arguments]    ${username}
    Input Text    id=user-name   ${username}

Input pwd
    [Arguments]    ${password}
    Input Text    id=password   ${password}

Click login button
    Click Button    id=login-button

Welcome page should be visible
    Page Should Contain Element    xpath=//*[@id="shopping_cart_container"]


Error page should be visible
    Page Should Not Contain Element        xpath=//*[@id="shopping_cart_container"]
  