*** Settings ***
Library    PuppeteerLibrary
Suite Teardown    Close Puppeteer
Resource  ${CURDIR}${/}../CONFIG/TestLifeCycle.resource

Suite Setup  TestLifeCycle.Default Suite Setup


*** Variables ***
&{options}    headless=${False} 

# # ${Register_btn}   //*[@class="jsx-3342260016 pml-btn pml-btn-txt header-user-btn"]/span[text()="Register"] 
# # ${Login_btn}    //*[@class="jsx-3342260016 pml-btn pml-btn-txt header-user-btn"]/span[text()="Login"] 
# # ${email_login_txt}    //*[@class="jsx-1695452889 pml-input__wrapper full-width"]/input[@class="jsx-1695452889 body1 pml-input__input"]
# ${email_login_txt}   //*[@id="modal"]/section/section/div/form/div[1]/div/div/input
# # ${email_login_txt}    //*[@type="email"]
# ${password_login_txt}    //*[@type="password"]
# ${login_login_btn}    //*[@class="jsx-3342260016 pml-btn pml-btn-pri auth__standalone-cta full-width"]
# # ${item_img}    //*[@id="page-wrap"]/div[4]/div[2]/div[1]/a/figure/div[3]
# ${newArrival_btn}    //*[@id="__next"]/header/div[2]/ul/li[1]/div/div/button
# ${first_item_img}    //*[@id="modal"]/nav[1]/div//child::img[@alt="New Arrivals"]
# # ${first_item_img}    //*[@id="modal"]/nav[1]/div/ul/li[1]/a/figure/picture/img
# ${picked_item_img}   //*[@id="page-wrap"]/div[4]/div[2]/div/div/div/div[1]/div/a/figure/div[3]/picture/img
# ${addToBag_btn}    //*[@class="jsx-3342260016 pml-btn pml-btn-pri pdp__add-to-bag-cta"]
# ${selectSize_S_btn}    //*[@id="page-wrap"]/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/button[1]
# ${cart_btn}     //*[@id="__next"]/header/div[4]/ul/div/li/span/img
# ${size_dropdown}    //*[@id="__next"]/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[1]/div/div/select

# ${quantity_dropdown}   //*[@id="__next"]/div[3]/div/div[2]/div[2]/div/div[2]/div[2]/div[2]/div/div/div/select
# ${cancel_item_btn}    //*[@id="__next"]/div[3]/div/div[2]/div[2]/div/div[1]/div/span/img
# ${promo_code_txt}    //*[@id="__next"]/div[3]/div/div[2]/div[3]/div[2]/div/div/div/input
# ${apply_code_btn}    //*[@id="__next"]/div[3]/div/div[2]/div[3]/div[2]/button
# ${proceed_chkout_btn}    //*[@id="__next"]/div[3]/div/div[5]/button

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