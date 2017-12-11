*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Objects/Tours.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_flight_rezervation
    Open Flights List Page
    Click Button    ${bookFlightNowButton}
    Page Should Contain    Booking Options
    Wait Until Element Is Visible    ${loginAsUserGuestButton}
    Click Element    ${loginAsUserGuestButton}
    Finish Flight Rezervation FlightsPage

2_flight_rezervation
    Open Flights List Page
    Click Button    ${bookFlightNowButton}
    Page Should Contain    Booking Options
    Wait Until Element Is Visible    ${loginAsKnownUser}
    Input Text    ${enterKnownEmailField}    ${demoLogin}
    Input Text    ${enterPasswordField}    ${demoPassword}
    Click Element    ${loginAsKnownUser}
    Finish Flight Rezervation FlightsPage

3_flight_search
    Open Flights List Page
    Click Element    ${modifySearchButtonFL}
    Wait Until Page Contains    Search
    Fill Search For Flight FlightsPage    ${flightOrigin}    ${flightDestination}    ${flightTimeDepart}
    Click Element    ${searchFlightButtonFL}
    Check Search For Flight Results FlightsPage

4_flight_search
    Click Element    ${searchFlightTab}
    Fill Search For Flight MainPage    ${flightOrigin}    ${flightDestination}    ${flightTimeDepart}
    Click Element    ${searchFlightButton}
    Check Search For Flight Results FlightsPage
