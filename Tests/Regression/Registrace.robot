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
    Wait Until Element Is Visible    ${myAcc}
    Click Element    ${myAcc}
    Click Link    ${signup}
    Title Should Be    Register
    Input Text    ${email}    ${useMail}
    Input Password    ${password}    ${usePswd}
    Input Password    ${passwordAgain}    ${usePswd}
    Click Button    ${submitBtn}
    Wait Until Page Contains    The First name field is required.
    Wait Until Page Contains    The Last Name field is required.
    Input Text    ${firstname}    ${useFirstname}
    Input Text    ${lastname}    ${useLastname}
    Click Button    ${submitBtn}
    Wait Until Page Contains    Hi, ${useFirstname}
    Title Should Be    My Account

2_reg_fail
    Wait Until Element Is Visible    ${myAcc}
    Click Element    ${myAcc}
    Click Link    ${signup}
    Input Text    ${email}    ${demoLogin}
    Input Password    ${password}    ${usePswd}
    Input Password    ${passwordAgain}    ${usePswd}
    Input Text    ${firstname}    ${useFirstname}
    Input Text    ${lastname}    ${useLastname}
    Click Button    ${submitBtn}
    Wait Until Page Contains    Email Already Exists.
    Title Should Be    Register

3_reg_passwords
    Go To    ${goToSignUp}
    Input Text    ${email}    wdawdaw@gmail.com
    Input Password    ${password}    ${usePswd}
    Input Password    ${passwordAgain}    ${usePswd2}
    Input Text    ${firstname}    ${useFirstname}
    Input Text    ${lastname}    ${useLastname}
    Click Button    ${submitBtn}
    Wait Until Page Contains    Password not matching with confirm password.
    Input Password    ${passwordAgain}    ${usePswd}
    Click Button    ${submitBtn}
    Wait Until Page Contains    Hi, ${useFirstname}
    Title Should Be    My Account
