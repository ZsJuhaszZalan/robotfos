*** Settings ***
Library     Selenium2Library

# 1. Shopping cart functionality
#     Add multiple products
#      Remove products from the shopping cart
#     Check the contents of the shopping cart

*** Test Cases ***
Add to cart    
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep   1s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    1s
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Sleep    1s
    Click Button    id=remove-sauce-labs-backpack
    Sleep    1s
    Click Button    id=remove-sauce-labs-bike-light
    Sleep    1s
    Element Should Contain    id=shopping_cart_container/a/span    3
    Click Element    id=shopping_cart_container/a

    ${item_count}=    Get Element Count    class=cart_item
    Should Be Equal As Numbers    ${item_count}
    Sleep    3s
    






    Close Browser