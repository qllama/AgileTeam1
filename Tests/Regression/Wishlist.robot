*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Default Tags      Wishlist
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Keywords/Search_Keywords.txt
Resource          ../../Keywords/Wishlist_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/MyAccount_Page.txt
Resource          ../../Objects/Login_Page.txt
Resource          ../../Objects/Result_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_wishlist_search_add_remove_tour
    Login
    Search Tour
    Wishlist Test Tour
    Open My Account
    Click Element    ${wishlist}
    Page Should Contain    6 Days Around Thailand
    Wait Until Element Is Visible    ${removeWishlist}
    Click Element    ${removeWishlist}
    Sleep    2
    Alert Should Be Present    Are you sure you want to remove from wishlist ?

2_wishlist_search_add_remove_car
    Login
    Search Car
    Wishlist Test Car
    Open My Account
    Click Element    ${wishlist}
    Page Should Contain    Ford Mondeo 2012
    Wait Until Element Is Visible    ${removeWishlist}
    Click Element    ${removeWishlist}
    Sleep    2
    Alert Should Be Present    Are you sure you want to remove from wishlist ?

3_wishlist_search_add_remove_hotel
    Login
    Search Hotel
    Wishlist Test Hotel
    Open My Account
    Click Element    ${wishlist}
    Page Should Contain    Grand Plaza Apartments
    Wait Until Element Is Visible    ${removeWishlist}
    Click Element    ${removeWishlist}
    Sleep    2
    Alert Should Be Present    Are you sure you want to remove from wishlist ?
