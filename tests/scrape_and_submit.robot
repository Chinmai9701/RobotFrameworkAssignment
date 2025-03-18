*** Settings ***
# Import required resource files containing keywords and variables
Resource   ../resources/scrape_players_data.robot
Resource   ../resources/submit_form.robot
Resource   ../resources/variables.robot


*** Test Cases ***
Scrape and Submit Player Data to Form
    [Documentation]    Scrapes player data from a specified URL and submits each player's information
    ...                to a web form

    # Scrape player data from given URL and save to CSV file
    Scrape Player Data   ${file_path}   ${Players_Data_URL}   ${Browser}

    # Read the CSV file and submit each player's data to the web form
    Read From CSV And Submit Form   ${file_path}   ${Form_Submission_URL}   ${Browser}

