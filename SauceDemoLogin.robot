*** Settings ***

Library     Selenium2Library

*** Test Cases ***
Login with standard user
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep   3s
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    wrong_password
    Click Button    //*[@id="login-button"]
    Sleep   3s
    Close Browser

Login with wrong username and valid_password
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    wrong_username
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep   3s
    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    chrome
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep   3s
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    //*[@id="user-name"]    standard_user
    Click Button    //*[@id="login-button"]
    Sleep   3s
    Close Browser