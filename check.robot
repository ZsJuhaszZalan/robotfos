*** Settings ***
Library     Selenium2Library
Library     Collections
Resource    LoginKeywords.robot

*** Test Cases ***
Üres mezők ellenőrzése
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name   Kiráj
    Input Text    id=last-name    Bence
    Input Text    id=postal-code    "6067"
    Click Button    id=continue
    Page Should Contain    text=Error: First Name is required


Üres mezők ellenőrzése
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Karoly
    Input Text    id=last-name    Robert
    Click Button    id=continue
    Page Should Contain     text=Error: Postal Code is required
    Close Browser

Üres mezők ellenőrzése
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Click Button    id=continue
    Page Should Contain     text=Error: First Name is required
    Close Browser

Érvénytelen adatok kezelése
    ${long_name}=    Evaluate    "A" * 100
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    ${long_name}=    Evaluate    "A" * 1000
    Input Text    id=first-name    ${long_name}
    Input Text    id=last-name    ${long_name}
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser


Érvénytelen adatok kezelése
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Bence$ß¤
    Input Text    id=last-name    Kiráj$ß¤
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser


Érvénytelen adatok kezelése
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    6067
    Input Text    id=last-name    6067
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Page Should Contain     text=Checkout: Your Information
    Close Browser

Checkout megszakítása   
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Click Button    id=cancel
    Page Should Contain     text=Your Cart
    Close Browser

Érvényes adatokkal sikeres checkout folytatása
    Login with standard user
    Click Element    class=shopping_cart_link
    Click Button    id=checkout
    Input Text    id=first-name    Bence
    Input Text    id=last-name    Kiráj
    Input Text    id=postal-code    5000
    Click Button    id=continue
    Click Button    id=finish
    Page Should Contain     text=Checkout: Overview
    Close Browser