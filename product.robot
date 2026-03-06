*** Settings ***
Library     Selenium2Library
Library     Collections
Resource    LoginKeywords.robot

*** Test Cases ***
Termék oldal megnyitása
    Login with standard user

Termék oldal megnyitása
    Login with standard user
    Click Element    class=inventory_item_img
    Sleep    1s
    Page Should Contain Element    class=inventory_detail_img

Termék információk ellenőrzése
    Login with standard user
    ${product_name}=    Get WebElement    class=inventory_item_name
    ${product_name_text}=    Get Text    ${product_name}
    Click Element    class=inventory_item_name
    Page Should Contain    ${product_name_text}
    Close Browser

Termék információk ellenőrzése
    Login with standard user
    ${product_price}=    Get WebElement    class=inventory_item_price
    ${product_price_text}=     Get Text    ${product_price}
    Click Element    class=inventory_item_name
    Page Should Contain     ${product_price_text}
    Close Browser

Termék információk ellenőrzése        
    Login with standard user
    Click Element    class=inventory_item_name
    Page Should Contain Element    class=inventory_details_desc
    Close Browser 



Termék információk ellenőrzése
    Login with standard user
    Sleep    1s
    Click Element    class=inventory_item_img
    Sleep    1s
    Page Should Contain Element    class=inventory_details_img
    Close Browser


Vissza navigáció
    Login with standard user
    Click Element    class=inventory_item_name
    Click Button    id=back-to-products
    Page Should Contain Element    class=inventory_item_name
    Close Browser