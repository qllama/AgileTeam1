*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Default Tags      Cars
Library           Selenium2Library
Resource          ../../Settings/Browser_Settings.txt
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/Cars.txt

*** Test Cases ***
1_search_car_homepage_pass
    Search Cars    ${pickUpLocation}    ${dropOffLocationValid}
    Click Button    ${detailsButton}
    Page Should Contain    ${valid}

2_search_car_menu_pass
    Search Cars Menu    ${pickUpLocation}    ${dropOffLocationValid}
    Click Button    ${detailsButton}
    Page Should Contain    ${valid}

3_search_car_homepage_fail
    Search Cars    ${pickUpLocation}    ${dropOffLocationInvalid}
    Page Should Contain    ${invalid}

4_search_car_menu_fail
    Search Cars Menu    ${pickUpLocation}    ${dropOffLocationInvalid}
    Page Should Contain    ${invalid}

5_book_car_registered
    Search Cars Menu    ${pickUpLocation}    ${dropOffLocationValid}
    Book Car as User

6_book_car_nonregistered
    Search Cars Menu    ${pickUpLocation}    ${dropOffLocationValid}
    Book Car as Guest
