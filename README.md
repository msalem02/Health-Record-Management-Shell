# Health Record Management System (Shell-Based)  
### Secure CLI Application for Managing Patient Medical Records

---

## Overview

Health Record Management Shell is a command-line application designed to securely manage and organize patient health information.  
The system allows hospitals, clinics, or small healthcare institutions to store, access, and update patient records directly through a shell interface, ensuring simplicity, portability, and full data control without requiring a graphical environment.

This project demonstrates solid command over Python scripting, file handling, modular programming, and data security, applying these to a realistic healthcare management scenario.

---

## Objectives

- Develop a command-line tool for health record storage and retrieval.  
- Implement a menu-driven interface for user interaction.  
- Use file-based storage (text/CSV) or database connections for persistence.  
- Apply data encryption, user authentication, and validation for security.  
- Enable CRUD operations (Create, Read, Update, Delete) on patient records.  
- Provide search, filtering, and sorting functions for efficiency.  

---

## Key Features

| Feature | Description |
|----------|-------------|
| User Authentication | Admin or staff must log in before accessing patient records. |
| Patient Record Management | Add, edit, delete, and view patient information via CLI menus. |
| Search and Filter | Locate records by patient ID, name, age, or diagnosis. |
| Data Encryption | Encrypts sensitive data for confidentiality. |
| Backup and Restore | Export and import patient data using backup files. |
| Logging System | Logs all user actions for accountability. |
| Error Handling | Comprehensive validation to prevent invalid or corrupted entries. |

---

## System Architecture

The program follows a modular architecture with separate files for each component:

Health-Record-Management-Shell/
│
├── main.py                # Main shell interface and control flow
├── auth.py                # Handles user authentication and access control
├── records.py             # CRUD operations for patient data
├── encryption.py          # Data encryption/decryption functions
├── utils.py               # Helper utilities (validation, formatting, logging)
├── data/                  # Stores patient data files
│   ├── patients.csv
│   └── logs.txt
├── backups/               # Backup copies of patient records
├── config/                # Configuration files and system constants
└── README.md              # Project documentation (this file)

---

## Data Model Example

### Patient Record Structure
| Field | Description |
|--------|-------------|
| Patient ID | Unique identifier for each patient |
| Name | Full name of the patient |
| Age | Age of the patient |
| Gender | Male/Female/Other |
| Diagnosis | Current health condition |
| Treatment | Prescribed medications or procedures |
| Doctor | Attending physician |
| Admission Date | Date of entry into the system |

Example (CSV format):
1001, "John Doe", 45, "Male", "Hypertension", "Medication", "Dr. Smith", "2025-03-11"

---

## How It Works

### 1. Authentication  
Users must log in using pre-defined credentials (stored securely).  
Example:
Welcome to Health Record Management System
Enter Username: admin
Enter Password: *****
Access Granted!

### 2. Main Menu  
After login, the user is presented with options:
1. Add New Record
2. View All Records
3. Search Records
4. Update Record
5. Delete Record
6. Export Data
7. Backup Database
8. Logout

### 3. Data Handling  
All operations modify patients.csv in real time.  
Each action (add, update, delete) is logged into logs.txt.

### 4. Backup System  
Users can export all data into the /backups directory.  
Backups include timestamped filenames for version tracking.

---

## Installation & Usage

### 1. Clone Repository
git clone https://github.com/msalem02/Health-Record-Management-Shell.git
cd Health-Record-Management-Shell

### 2. Run Application
python main.py

### 3. Login
Use provided admin credentials or configure new ones in config/auth.json.

---

## Security Features

- Password-protected access control  
- AES-like encryption for sensitive data (if enabled)  
- Input validation for safe data handling  
- Logging of all CRUD and authentication operations  

---

## Dependencies

The application is lightweight and relies only on Python’s standard libraries:  
- os — file management  
- csv — data storage and manipulation  
- datetime — logging and timestamping  
- getpass — hidden password input  
- json — configuration handling  

Optional (for encryption and backups):
- cryptography
- shutil

---

## Example Execution Flow

1. Admin logs in → access granted.  
2. Adds patient record → saved to patients.csv.  
3. Searches patient ID 1001 → displays full info.  
4. Updates treatment plan → changes reflected instantly.  
5. Logs out → session closed, entry added to logs.txt.

---

## Future Enhancements

- Migrate from CSV storage to SQLite3 or MySQL database.  
- Add multi-user role system (Admin, Doctor, Receptionist).  
- Implement audit dashboard for summarized analytics.  
- Integrate with email notification system for new records.  
- Add command history and shell auto-completion features.  
- Deploy as an executable (.exe/.deb) for offline use.

---

## Author

Mohammed Salem  
Email: salemmohamad926@gmail.com  
LinkedIn: https://www.linkedin.com/in/msalem02  
GitHub: https://github.com/msalem02  

---

## License

This project is licensed under the MIT License.  
You may freely use, modify, and distribute it for educational or professional purposes.  
See the LICENSE file for full details.

---

## Acknowledgements

- Birzeit University — Computer Engineering Department  
- Python Standard Library documentation  
- Community contributors and testing volunteers  
- Open-source developer community  

---

## Version History

| Version | Date | Description |
|----------|------|-------------|
| 1.0 | March 2024 | Initial shell-based health management system |
| 1.1 | April 2024 | Added encryption and logging modules |
| 1.2 | May 2024 | Added backup and restore features |
| 2.0 | June 2024 | Improved CLI interface and data validation |
