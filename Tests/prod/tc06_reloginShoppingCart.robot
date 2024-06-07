*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/logedInUserSetup.robot
Resource    ../../Resources/shoppingCart.robot
Resource    ../../Resources/dropDown_common_resources.robot


*** Variables ***

*** Test Cases ***
Shopping cart relogin
    Set login page ready
    Reset shopping cart
    Read shopping list and add items to cart
    Click shopping cart icon
    Get price and name details to nameprice.csv file
    ${message}    Match cart items to shopping list
    Remove File    nameprice.csv
    Check message    ${message}
    Click Logout
    Input username    standard_user
    Input pwd    secret_sauce 
    Click login button
    Click shopping cart icon
    Sleep    5s
    Take Screenshot
    Get price and name details to nameprice.csv file
    ${message}    Match cart items to shopping list
    Remove File    nameprice.csv
    Check message    ${message}
    Close Browsers


*** Keywords ***
Check Message
    [Arguments]    ${message}
    Run Keyword If    'Fail' in '''${message}'''    Fail    The test should not indicate success
Check message for failure 
    [Arguments]    ${message}
    Run Keyword If    'Success' in '''${message}'''    Fail    The test should not indicate success

    
    
    
    
    
    
