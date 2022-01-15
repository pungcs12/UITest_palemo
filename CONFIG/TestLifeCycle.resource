# *** Settings ***
# Variables  ${CURDIR}${/}./TEST_DATA_DEFAULT.yml

*** Keywords ***
Load locators
    import Variables   ${CURDIR}/locators.yml

Load testuser
    import Variables    ${CURDIR}/Test_data.yml

Default Suite Setup
    Load locators
    Load testuser