*** Settings ***
Library     SeleniumLibrary
Library    Screenshot



Resource    logintest_common_resources.robot


*** Variables ***
${menu}      react-burger-menu-btn
${logout}      logout_sidebar_link


*** Keywords ***
 
Click Logout
    Wait Until Element Is Visible    id=${menu}
    Click Button   id=${menu}
    Wait Until Element Is Visible    id=${logout}
    Click Element   id=${logout}
Success messege must appear
    Page Should Contain    Accepted usernames are: 
  