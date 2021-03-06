*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Register_Page.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_reg_pass
    Register Correct
    Check Registration Pass

2_reg_fail
    Register Incorrect
    Check Registration Fail

3_reg_passwords
    Register Using Different Passwords
    Check Registration Pass
