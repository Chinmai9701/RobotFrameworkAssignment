*** Settings ***
Documentation    This script consists of keywords to scrape player salaries from a website.
...              Gets player names and their salaries using browser automation.
Library    SeleniumLibrary
Library    CSVLibrary
Library    OperatingSystem

*** Keywords ***
Open Browser and Navigate
    [Documentation]    Opens a specified browser and navigates to the given URL.
    ...                Maximizes the browser window for better visibility.
    [Arguments]    ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

Scrape Player Data
    [Documentation]    Scrapes first 5 player names and salaries from a webpage
    ...                and saves them to a CSV file.  

    [Arguments]    ${file_path}    ${URL}    ${Browser}
    # Open browser and navigate to the target page
    Open Browser and Navigate    ${URL}    ${Browser}
    
    # Locate player names and salary elements
    ${players}    Get WebElements    xpath://td[@class='name']
    ${salaries}    Get WebElements    xpath://td[@class='hh-salaries-sorted']
    
    # Create and empty the csv file
    Create File    ${file_path}    ${EMPTY}
    # Prepare CSV file with headers
    ${header}=    Create List    Name    Salary
    Append To CSV File    ${file_path}    ${header}

    # Iterate through first 5 players, extract data and append it to the csv file
    FOR    ${index}    IN RANGE    1    6
        ${player_name}    Get Text    ${players}[${index}]
        ${salary}         Get Text    ${salaries}[${index}]
        ${row}    Create List    ${player_name}    ${salary}
        Append To CSV File    ${file_path}    ${row}
    END
    Close Browser
