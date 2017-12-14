** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/HotelsList_Page.txt
Resource          ../../Objects/HotelBooking_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_search_hotels_menu
    Open Hotels List Page
    Search Hotel On The Menu List Page

2_search_hotels_homepage
    Search Hotel On The Homepage List Page

3_hotel_reservation_guest
    Open Hotels List Page
    Search Hotel On The Menu List Page
    Reservation Hotel On The Menu Page For Nonregister User

3_hotel_reservation_user
    Open Hotels List Page
    Search Hotel On The Menu List Page
    Reservation Hotel On The Menu Page For Register User



