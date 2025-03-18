*** Settings ***   
Documentation    This script consists of keywords that handles reading data from CSV 
...              and submitting form entries with automated browser interactions.
Library   SeleniumLibrary
Library   CSVLibrary

*** Keywords ***
Open Browser and Navigate
    [Documentation]    Opens a specified browser and navigates to the given URL.
    ...                Maximizes the browser window for better visibility.
    [Arguments]    ${URL}   ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

Read From CSV And Submit Form
    [Documentation]    Reads data from a CSV file and submits form entries multiple times.
    ...                The keyword performs the following steps:
    ...                1. Reads players data from CSV file
    ...                2. Uses predefined DOB list
    ...                3. Opens browser and navigates to URL
    ...                4. Submits form for each row of data
    ...                5. Closes browser after completion
    [Arguments]   ${file_path}   ${URL}   ${Browser}
    # Read CSV data into a list
    ${csv_list}=  Read CSV File To List   ${file_path}  
    
    # Predefined list of dates of birth of players
    ${dob_list}=  Create List  01-Jan-1981   01-Feb-1982   23-Mar-1976   01-Sep-1978   03-Jul-1945
    
    # Initialize browser session
    Open Browser and Navigate   ${URL}   ${Browser}
    Sleep    3s    # Wait for browser window to maximize
    
    # Loop through data and submit form
    FOR   ${index}   IN RANGE   0    5
        # Fill in name field
        Input Text   id:name    ${csv_list}[${index + 1}][0]
        sleep   2
        
        # Convert date of birth to the correct format and fill in date field
        ${formatted_date}=    Evaluate    datetime.datetime.strptime("${dob_list}[${index}]", "%d-%b-%Y").strftime("%d-%m-%Y")    modules=datetime
        Input Text   id:date   ${formatted_date} 
        sleep   2
        
        # Submit form and wait for completion
        Click Button    xpath://Button[@class='btn__submit']
        sleep   2
        
        # Reset form for next iteration
        Reload Page
    END
    
    sleep   3
    Close Browser
     