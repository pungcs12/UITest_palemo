*** Settings ***
Library    PuppeteerLibrary
Suite Teardown    Close Puppeteer

*** Variables ***
&{options}    headless=${False} 

${Register_btn}   //*[@id="__next"]/header/div[4]/ul/li[1]/button/span

*** Test Cases ***
Demo script 01
    [Teardown]    Close All Browser
    Open Browser    https://www.pomelofashion.com/th/en/     browser=chrome      options=${options}  
    Log to console  xpath=${Register_btn}
    Click Element    xpath=${Register_btn}

    Wait Until Page Contains    GET UP TO
    # Run Async Keywords
    # ...    Click Element    css=a[href="https://qahive.github.io/robotframework-puppeteer/PuppeteerLibrary.html"]    
    # ...    Wait For New Window Open    
#     Switch Window    NEW
#     Wait Until Page Contains    Library version
        
# Demo script 02
#     [Teardown]    Close All Browser 
#     Open Browser    https://qahive.github.io/robotframework-puppeteer.github.io/    browser=chrome    options=${options}        
#     Click Element    css=a[href="#team"]



# *** Settings ***
# Library   Browser
# # Library    DataDriver    ${CURDIR}${/}../resources/test03.csv  dialect=excel  encoding=utf8

# # Test Template    test03

# *** Test Cases ***
# Test_case_01
#     Log to console  Starting processing test cases

# *** Keywords ***
# testcase
#     [Arguments]  ${No}  ${Case}  ${username}  ${password}  ${text_validate}  ${locator_validate}
#     new browser  headless=false  timeout=0:00:30
#     New Page    http://the-internet.herokuapp.com/login

#     # ACTION
#     Fill Text  xpath=//*[@id="username"]  ${username}
#     Fill Text  xpath=//*[@id="password"]  ${password}
#     click  xpath=//*[@class="radius"]


#     # ASSERTION
#     ${str}  Get Text  ${locator_validate}
#     Should contain  ${str}  ${text_validate}