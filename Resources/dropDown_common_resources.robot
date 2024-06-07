*** Settings ***
Library     SeleniumLibrary
Library    Screenshot
Library    OperatingSystem
Library    ../Resources/python_common_modules.py 


Resource    logintest_common_resources.robot
Resource    logout_common_resource.robot
Resource    logedInUserSetup.robot


*** Variables ***
${file1}    elements.csv
${file2}    prices.csv
${combinedfile}    nameprice.csv


*** Keywords ***
Set login page ready
    Open loged in Window in chrome
Wait for page to appear
    Sleep    1s   # Waiting for the page to load completely
Sort products from Z to A
    Select From List by Value    css:.product_sort_container    za
Sort products from low price to high price
    Select From List by Value    css:.product_sort_container    lohi

Sort products from A to Z
    Select From List by Value    css:.product_sort_container    az
Sort products from high price to low price
    Select From List by Value    css:.product_sort_container    hilo

Get price and name details to nameprice.csv file

    Create File    ${file1}    # Create an empty CSV file
    @{elements}    Get WebElements    css:.inventory_item_name   
    FOR    ${element}    IN    @{elements}
       Append To File   ${file1}    ${element.text}\n    # Save the text to a CSV file
       END

    Create File    ${file2}    # Create an empty CSV file
    @{prices}    Get WebElements    css:.inventory_item_price   
    FOR    ${price}    IN    @{prices} 
       Append To File   ${file2}    ${price.text}\n    # Save the text to a CSV file
       END    
    
    Create File    ${combinedfile}
    CombineCsvFiles  ${file1}  ${file2}    ${combinedfile}
    Remove File    ${file1}
    Remove File    ${file2}

    
