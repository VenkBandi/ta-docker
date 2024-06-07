*** Settings ***
Library     SeleniumLibrary

Library    ../Resources/python_common_modules.py 
Library    python_common_modules.py


Resource    logedInUserSetup.robot

*** Variables ***



*** Keywords ***
Read shopping list and add items to cart
    ${shopping_cart}=    Shopping Cart Add    Data/shopping_cart.txt
    FOR    ${item}    IN    @{shopping_cart}
        Add item to shopping cart    ${item}
    END

Add item to shopping cart
    [Arguments]    ${item}
    Click Button    ${item}
    Sleep    2s    

Match cart items to shopping list
    ${cart_list} =    Cart List    nameprice.csv
    ${user_list} =    User List     Data/shopping_cart.txt
    ${truth_value} =    Match List    ${cart_list}    ${user_list}
    ${messege}=    Get Message Cart    ${truth_value}
    RETURN    ${messege}
    
Match cart items to incorrect shopping list
    ${cart_list} =    Cart List    nameprice.csv
    ${user_list} =    User List     Data/incorrect_shopping_cart.txt
    ${truth_value} =    Match List    ${cart_list}    ${user_list}
    ${messege}=    Get Message Cart    ${truth_value}
    RETURN    ${messege}
    


    


