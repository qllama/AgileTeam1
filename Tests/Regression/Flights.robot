*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Library           Selenium2Library    #Test Teardown    Close Browser
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
    Wait Until Element Is Visible    ${originFlightField}    100
    Click Element    ${originFlightField}
    Input Text    ${activeSetFlightField}    ${flightOrigin}
    Wait Until Element Is Visible    //*[@id="select2-drop"]/ul/li/div    100
    Click Element    //*[@id="select2-drop"]/ul/li/div
    Click Element    ${destinationFlightField}
    Input Text    ${activeSetFlightField}    ${flightDestination}
    Wait Until Element Is Visible    ${timeDepartFlightField}    100
    Click Element    ${timeDepartFlightField}
    Wait Until Element Is Visible    //*[@id="flight"]/form/div[3]/div[1]
    Click Element    //*[@id="flight"]/form/div[3]/div[1]
    Input Text    //*[@id="flight"]/form/div[3]/div[1]/input    ${flightTimeDepart}
    Click Element    ${searchFlightButton}
    Check Search For Flight Results FlightsPage
