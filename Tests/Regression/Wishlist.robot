*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Default Tags      Wishlist
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/MyAccount_Page.txt
Resource          ../../Objects/Login_Page.txt
Resource          ../../Objects/Result_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_wishlist_search_add_remove_tour
    Login
    Search Tour
    Wishlist Test    ${wishlistTourSearch}
    Open Wishlist
    Page Should Contain    6 Days Around Thailand
    Remove From Wishlist Account

2_wishlist_search_add_remove_car
    Login
    Search Cars    ${startCar}    ${endCar}
    Wishlist Test    ${wishlistCarSearch}
    Open Wishlist
    Page Should Contain    Ford Mondeo 2012
    Remove From Wishlist Account

3_wishlist_search_add_remove_hotel
    Login
    Search Hotel
    Wishlist Test    ${wishlistHotelSearch}
    Open Wishlist
    Page Should Contain    Grand Plaza Apartments
    Remove From Wishlist Account

4_wishlist_list_add_remove
    Login
    Wishlist Overview Test    ${tourList}    ${wishlistTourList}
    Wishlist Overview Test    ${carList}    ${wishlistCarList}
    Wishlist Overview Test    ${hotelList}    ${wishlistHotelList}

5_wishlist_nonRegisteredUser
    Search Tour
    Add To Wishlist Tour
    Alert Should Be Present    ${alertNOK}
