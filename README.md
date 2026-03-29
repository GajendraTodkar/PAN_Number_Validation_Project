<h1 align="center">  💳 PAN Card Validation using SQL </h1>

---

## 📌 Project Overview

This project focuses on data cleaning and validation of PAN (Permanent Account Number) records using SQL Server.  
The goal is to ensure each PAN number adheres to the official format and is accurately classified as Valid or Invalid.

---

## 🎯 Objectives
 * Clean and preprocess raw PAN dataset
 * Validate PAN numbers based on strict business rules
 * Categorize records into Valid and Invalid
 * Generate a summary report for data quality insights

---

## 🧹 Data Cleaning Steps
 * Removed duplicate records using **DISTINCT**
 * Trimmed leading/trailing spaces using **TRIM()**
 * Standardized text using **UPPER()**
 * Filtered out missing or blank values
 * Deduplication: Identified and removed duplicate entries. 

---

## ✅ Validation Rules

### A valid PAN must:
 * Be exactly 10 characters long
 * Follow pattern     → AAAAA1234A
 * First 5 characters → Alphabets (A–Z)
 * Next 4 characters  → Digits (0–9)
 * Last character     → Alphabet

### Additional Constraints: Standard Format (AAAAA1234A)

 *  No Repeating Adjacent Characters: Prevented entries like **'AABCD'** or **'1123'**.  
 *  No Sequential Characters: Alphabets and numbers cannot form a continuous sequence (e.g., **'ABCDE'** or **'1234'** are flagged as invalid)
 
---

## ⚙️ Implementation Details
### 🔹 User-Defined Functions (UDFs):
 * **dbo.adj_char()** → Detects adjacent repeating characters.
 * **dbo.seq_char()** → Detects sequential character patterns (both letters and digits).

---

### 🔹 SQL Techniques Used
 * **CTEs**: Used a chain of Common Table Expressions (clean_data, valid_data, categorized_data) to keep the final query readable and performant.
 * Pattern matching using **LIKE**
 * String functions **(SUBSTRING, TRIM, UPPER)**
 * Conditional logic using **CASE**

---

## 📊 Results & Reporting
The final query generates a summary report:

**- Total Records: 10,000**  
**- Total Valid PANs: 3,186**  
**- Total Invalid PANs: 5,839**  
**- Missing / Removed Records: 975**  

---

## 📁 Repository Structure
```
PAN_Number_Validation_Project/
│
├── Datasets/                         → Raw datasets used for the project. (ERP and CRM data)
│
├── Scripts/                          
│   ├── Functions_usingSQL_server.sql → Custom functions (dbo.adj_char & dbo.seq_char)
│   ├── QA_Script.sql                 → Exploratory analysis
│   ├── Final_script.sql              → Main validation query
│
├── PAN Number Validation             → Problem Statement.pdf
```

---

## 🌐 Important Links & Tools:

Everything is for Free!

- **[Datasets](https://github.com/GajendraTodkar/PAN_Number_Validation_Project/tree/main/Dataset):** Access to the project dataset (csv files).  <br>
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting your SQL database.  <br>
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing and interacting with databases.

---

 ## ☕ Stay Connected

Let's stay in touch! Feel free to connect with me on the following platforms:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)]()
[![Website](https://img.shields.io/badge/Website-000000?style=for-the-badge&logo=google-chrome&logoColor=white)](gajendra.todkar.github.io)

