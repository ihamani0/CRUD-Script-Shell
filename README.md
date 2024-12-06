# Linux Bash Database Manager Mini Project
**Overview**
This project is a simple command-line database management system written in Bash. It allows users to add, search, and edit entries in a CSV file. The script is designed to run in a Linux environment and leverages Bash scripting capabilities to interact with the file system and handle user input.

**Features**
Add Entries: Users can add new entries with details such as Name, Email, Telephone, Mobile, Place, and Message.

Search and Edit Entries: Users can search for existing entries by Name, Email, Telephone, Mobile, Place, or Message, and edit them if needed.

Validation: The script validates user inputs to ensure they meet specific criteria (e.g., names must be alphabetic, emails must contain @, phone numbers must be 10 digits).

Logging: Actions such as displaying data, editing entries, and adding new entries are logged to a file for tracking.

**Prerequisites**
Linux Environment: The script is designed to run in a Linux environment with Bash installed.

Bash Shell: Ensure that Bash is available on your system.

**How to Use**
Clone the Repository:

bash
Copy
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name
Make the Script Executable:

bash
Copy
chmod +x Project-USA.sh
Run the Script:

bash
Copy
./Project-USA.sh
Follow the On-Screen Instructions:

Choose between "Add Entry" and "Search / Edit Entry" options.

Follow the prompts to add new entries or search and edit existing ones.

**Example Usage**
Adding an Entry
Choose "Add Entry" from the menu.

Enter the required details when prompted.

Searching and Editing an Entry
Choose "Search / Edit Entry" from the menu.

Search for an entry by Name, Email, Telephone, Mobile, Place, or Message.

Select the entry to edit and modify the fields as needed.

**Notes**
The script automatically creates the necessary directory and file if they do not exist.

The script logs actions to databaselog_<current_date>.log in the DataBase directory.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Feel free to customize this README further to better fit your project's specifics or add any additional information you think is necessary.
