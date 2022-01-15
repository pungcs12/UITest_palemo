*** Settings ***
Library    PuppeteerLibrary
Suite Teardown    Close Puppeteer
Resource  ${CURDIR}${/}../CONFIG/TestLifeCycle.resource

Suite Setup  TestLifeCycle.Default Suite Setup


*** Variables ***
&{options}    headless=${False} 

*** Keywords ***
Open Browser Palemo URL
    Open Browser    https://www.pomelofashion.com/th/en/     browser=chrome      options=${options} 

*** Test Cases ***
TestCase 01 Register page is active
    [Teardown]    Close All Browser
    Open Browser Palemo URL 
    Click Element    xpath=${Register_btn}

    Wait Until Page Contains    GET UP TO
    Close Browser

TestCase 02 a customer is able to add a purchased product
    Open Browser Palemo URL  
    Click Element    xpath=${Login_btn}
    sleep  1s
    Input Text   xpath=${email_login_txt}   ${user01.username}   
    Input Text   xpath=${password_login_txt}    ${user01.password}    
    Click Button    xpath=${login_login_btn}

    sleep  5s
    Element Should Be Enabled    xpath=${newArrival_btn}
    Click Button   xpath=${newArrival_btn}
    Click Element   xpath=${first_item_img}
    Click Element   xpath=${picked_item_img}
    Click Element   xpath=${selectSize_S_btn}
    Click Button    xpath=${addToBag_btn}

TestCase 03 a customer is able to view the product in the cart
    Click Element   xpath=${cart_btn}
    sleep  5s
    Wait until Page Contains  Payment Summary

TestCase 04 a customer is able to select the size
    Select From List By Value   xpath=${size_dropdown}  186031
    ${selected_Value}  Get Selected List Value  xpath=${size_dropdown}
    Should Be Equal As Strings  ${selected_Value}  186031
    sleep  5s


TestCase 05 a customer is able to select the quantity
    Select From List By Value   xpath=${quantity_dropdown}  2
    ${selected_Value}  Get Selected List Value  xpath=${quantity_dropdown}
    Should Be Equal As Strings  ${selected_Value}  2

TestCase 06 a customer is able to enter a promo code
    Input Text  xpath=${promo_code_txt}  Test Apply Enable

TestCase 07 a customer is able to click a APPLY after entering a code   
    Element Should Be Enabled  xpath=${apply_code_btn}

TestCase 08 a customer is able to proceed to checkout
    Element Should Be Enabled  xpath=${proceed_chkout_btn}

TestCase 09 a customer is able to remove the selected item
    Click Element  xpath=${cancel_item_btn}