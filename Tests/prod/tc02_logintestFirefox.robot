*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../../Data/mock_user_data.xlsx    sheet_name=Sheet1

Resource    ../../Resources/logintest_common_resources.robot

Suite Teardown    Close Browsers
Test Template    Valid login


*** Test Cases ***
LoginTestwithAcceptedUsernames    ${username}    ${password}    
    


*** Keywords ***
Valid login
    [Arguments]    ${username}    ${password}
    [Tags]    Acceptedusers
    Open my Browser in firefox
    Input username    ${username}
    Input pwd    ${password}
    Click login button
    Welcome page should be visible
    Close Browsers
    