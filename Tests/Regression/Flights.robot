*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Objects/Tours_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_flight_rezervation
    Open Flights List Page
    Go To Booking Options
    Login As Guest User FlightsPage
    Finish Flight Rezervation FlightsPage

2_flight_rezervation
    Open Flights List Page
    Go To Booking Options
    Login As Known User FlightsPage    ${demoLogin}    ${demoPassword}
    Finish Flight Rezervation FlightsPage

3_flight_search
    Open Flights List Page
    Modify Search FlightsPage
    Search For Flight FlightsPage    ${flightOrigin}    ${flightDestination}    ${flightTimeDepart}
    Check Search For Flight Results FlightsPage

4_flight_search
    Click Element    ${searchFlightTab}
    Search For Flight MainPage    ${flightOrigin}    ${flightDestination}    ${flightTimeDepart}
    Check Search For Flight Results FlightsPage
