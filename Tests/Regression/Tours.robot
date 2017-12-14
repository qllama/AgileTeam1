*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Default Tags      Tours
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Objects/Tours.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_search_tour_homepage
    SearchTourHome

2_search_tour_menu
    StartTourSearch

3_tour_reservation_guest
    StartTourSearch
    BookTour
    FillReservationGuest
    FinishTourBooking

4_tour_reservation_user
    StartTourSearch
    BookTour
    FillReservationUser
    FinishTourBooking
