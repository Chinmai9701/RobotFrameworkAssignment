*** Variables ***
# URL for scraping players data
${Players_Data_URL}        https://hoopshype.com/salaries/players/

# URL for form submission testing
${Form_Submission_URL}     https://selenium-practice.netlify.app/

# Path to CSV file for storing players data
${file_path}               ${CURDIR}${/}..${/}data${/}player_data.csv

# Default browser for test execution
${Browser}                 Chrome
