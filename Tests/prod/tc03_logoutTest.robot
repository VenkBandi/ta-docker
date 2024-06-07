*** Settings ***
Library    SeleniumLibrary

Resource    ../../Resources/logout_common_resource.robot
Resource    ../../Resources/logedInUserSetup.robot




*** Test Cases ***
Checking logout functionality of accepted users in chrome
    Open loged in Window in chrome
    Click Logout
    Success messege must appear

Checking logout functionality of accepted users in firefox 
    Open loged in Window in firefox
    Click Logout
    Success messege must appear


*** Keywords ***

