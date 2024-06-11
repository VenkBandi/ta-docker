*** Settings ***
Library     SeleniumLibrary




*** Variables ***
${URL}      https://www.saucedemo.com/
${BROWSER}      Chrome
${OPTIONS}       
${REMOTE_URL}  ${EMPTY}


*** Keywords ***
Open headless Browser in chrome
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome_options}  add_argument  --headless
    Call Method  ${chrome_options}  add_argument  --no-sandbox
    Call Method  ${chrome_options}  add_argument  --disable-dev-shm-usage
    Create Webdriver  Chrome  options=${chrome_options}
    Go To  ${URL}



Open headless Browser in firefox
    ${firefox_options}=  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys, selenium.webdriver
    Call Method  ${firefox_options}  add_argument  -headless
    Call Method  ${firefox_options}  add_argument  -no-sandbox
    Call Method  ${firefox_options}  add_argument  -disable-dev-shm-usage
    Create Webdriver  Firefox  options=${firefox_options}
    Go To  ${url}

Close Browsers
    Close All Browsers


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
  