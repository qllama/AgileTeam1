*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Login_Page.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_login_pass
    LoginCorrect
    Check Login
    Logout
    Title Should Be    Login

2_login_fail
    LoginFail
    Title Should Be    Login
