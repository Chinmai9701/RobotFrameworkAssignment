## Prerequisites

- Python 3.11.0
- Google Chrome (Version 134.0.6998.89)
- ChromeDriver (Version 134.0.6998.88)

## Setup Instructions

1. **Install Python 3.11.0**
   - Download and install from [Python's official website](https://www.python.org/downloads/)

2. **Create and Activate Virtual Environment**
   ```cmd
   python -m venv venv
   # On Windows
   .\venv\Scripts\activate
   # On Unix or MacOS
   source venv/bin/activate
   ```

3. **Install Required Packages**
   ```cmd
   pip install robotframework==6.1.1
   pip install robotframework-seleniumlibrary==6.7.1
   # Or install all dependencies using:
   pip install -r requirements.txt
   ```

4. **Setup ChromeDriver**
   - Download ChromeDriver version 134.0.6998.88
   - Add ChromeDriver to your system's PATH environment variable
   - Note: This version is compatible with Chrome 134.0.6998.89

5. **Verify Setup**
   ```cmd
   robot --version
   pip show robotframework-seleniumlibrary
   ```

## Project Components

### 1. Resources
- `variables.robot`: Contains configuration variables like URLs and file paths
- `scrape_players_data.robot`: Keywords for web scraping player data
- `submit_form.robot`: Keywords for form submission automation

### 2. Test Cases
- `scrape_and_submit.robot`: Main test suite that:
  - Scrapes player data from HoopsHype
  - Saves data to CSV
  - Submits data to test form

### 3. Data
- Stores `player_data.csv` containing scraped player information

### 4. Reports
- Directory for test execution reports

## Running the Tests

Execute the test suite using:
```cmd
robot --outputdir Reports tests/scrape_and_submit.robot
```

## What the Test Does

1. **Web Scraping**
   - Visits HoopsHype salary page
   - Scrapes first 5 players' names and salaries
   - Saves data to CSV file

2. **Form Submission**
   - Reads player data from CSV
   - Submits data to test form with:
     - Player name
     - Formatted date of birth
   - Repeats for all players

## Dependencies

Key dependencies from requirements.txt:
- robotframework==6.1.1
- robotframework-seleniumlibrary==6.7.1
- robotframework-csvlibrary==0.0.5
- selenium==4.29.0

## Notes

- Test reports are generated in the Reports directory
- The project uses predefined dates of birth for form submission
- Chrome and ChromeDriver versions should be compatible

## References

1. **Official Documentation**
   - [Robot Framework Official Documentation](https://robotframework.org/)
   - [Robot Framework CSV Library](https://rawgit.com/s4int/robotframework-CSVLibrary/master/doc/CSVLibrary.html#library-documentation-top)

2. **Web Resources**
   - [HoopsHype](https://hoopshype.com/salaries/players/) - Source for player salary data
   - [Selenium Practice Site](https://selenium-practice.netlify.app/) - Form submission testing site

3. **Development Tools & Support**
   - [ChatGPT](https://chat.openai.com/) - AI assistance for code development
   - [Google Search](https://www.google.com/) - General troubleshooting and research
   - [Python Official Website](https://www.python.org/) - Python installation and documentation
   - [ChromeDriver Downloads](https://chromedriver.chromium.org/downloads) - WebDriver for Chrome automation
   - [YouTube](https://www.youtube.com/) - Tutorial videos and implementation examples





