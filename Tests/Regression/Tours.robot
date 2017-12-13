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
    Click Element    ${tourButtonHome}
    Wait Until Element Is Visible    ${searchButton}
    Click Element    ${searchButton}
    Click Element    ${detailsButton}

2_search_tour_menu
    StartTourSearch

3_tour_reservation_guest
    StartTourSearch
    BookTour
    Click Element    ${guestTab}
    Input Text    ${firstName}    ${name}
    Click Element    ${lastName}
    Input Text    ${lastName}    ${name2}
    Click Element    ${email}
    Input Text    ${email}    ${em}
    Click Element    ${confirmEmail}
    Input Text    ${confirmEmail}    ${em}
    Execute Javascript    window.scrollTo(${screenToursA})
    Wait Until Element Is Visible    ${contactNumber}
    Click Element    ${contactNumber}
    Input Text    ${contactNumber}    ${tel}
    Click Element    ${address}
    Input Text    ${address}    ${userAddress}
    Execute Javascript    window.scrollTo(${screenToursB})
    Click Element    ${selectCountry}
    Click Element    ${czechRepublic}
    FinishTourBooking

4_tour_reservation_user
    StartTourSearch
    BookTour
    Click Element    ${signInTab}
    Execute Javascript    window.scrollTo(${screenToursA})
    Wait Until Element Is Visible    ${demoEmailField}
    Click Element    ${demoEmailField}
    Input Text    ${demoEmailField}    ${demoEmail}
    Click Element    ${passwordField}
    Input Password    ${passwordField}    ${demoPassword}
    Execute Javascript    window.scrollTo(${screenToursB})
    FinishTourBooking
