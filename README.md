========================================
OpenSCAP CIS Compliance Automation
========================================

**Project Name: ** OpenSCAP CIS Compliance Automation

Description:
This project automates Linux security compliance scanning using OpenSCAP and CIS benchmarks. 
It performs automated compliance scans, generates HTML reports, calculates compliance scores,
and optionally applies remediation to fix failed security rules.

----------------------------------------
Project Overview
----------------------------------------

This project performs the following tasks:

1. Runs CIS benchmark security scans using OpenSCAP
2. Generates HTML compliance reports
3. Calculates compliance percentage
4. Automates remediation of failed rules
5. Stores logs and reports for auditing

----------------------------------------
Technologies Used
----------------------------------------

OpenSCAP
CIS Benchmark
Bash Scripting
Linux Security Hardening

----------------------------------------
Project Structure
----------------------------------------

Openscap
|
|-- scripts
|   |-- scan.sh
|   |-- remediation.sh
|
|-- reports
|
|-- logs
|
|-- screenshots
|
|-- README.md

----------------------------------------
Installation
----------------------------------------

Install required packages:

apt update
apt install libopenscap8 mailutils git unzip -y

Download CIS benchmark content:

wget https://github.com/ComplianceAsCode/content/releases/download/v0.1.79/scap-security-guide-0.1.79.zip

Unzip the file:

unzip scap-security-guide-0.1.79.zip

----------------------------------------
Run Compliance Scan
----------------------------------------

Execute the scan script:

./scripts/scan.sh

This script will:

- Run CIS benchmark scan
- Generate results.xml
- Generate HTML security report
- Calculate compliance percentage

----------------------------------------
Run Automated Remediation
----------------------------------------

To automatically fix failed CIS rules run:

./scripts/remediation.sh

This script will apply remediation rules and generate a new compliance report.

----------------------------------------
Example Output
----------------------------------------

Example scan output:

Total Rules : 620
Passed      : 239
Failed      : 116
Compliance  : 38%

After remediation the compliance score will increase.

----------------------------------------
Screenshots
----------------------------------------

Add screenshots of the following:

1. Terminal scan output
2. OpenSCAP HTML report dashboard
3. Remediation execution
4. Compliance improvement

Example folder structure:

screenshots/
scan-output.png
report-dashboard.png
remediation.png

----------------------------------------
Key Features
----------------------------------------

- Automated CIS benchmark scanning
- HTML compliance report generation
- Compliance score calculation
- Automated remediation
- Script based automation
- Easy cron integration

----------------------------------------
Future Improvements
----------------------------------------

- Email alert with HTML report
- Compliance monitoring dashboard
- Multi-server scanning
- CI/CD pipeline integration

----------------------------------------
Author
----------------------------------------

Anurag Utkarsh

Linux Administrator | DevOps | Cloud Security


<img width="744" height="501" alt="Screenshot 2026-03-05 181456" src="https://github.com/user-attachments/assets/d3a7f836-acca-4bae-8c70-9a2c4e6e2614" />
<img width="1358" height="667" alt="Screenshot 2026-03-05 181130" src="https://github.com/user-attachments/assets/f59c7a22-cd94-4510-841c-1d4fce9fc811" />
<img width="1352" height="677" alt="Screenshot 2026-03-05 181111" src="https://github.com/user-attachments/assets/3ad80809-de59-4224-9600-f29ba1c518ee" />
<img width="933" height="497" alt="Screenshot 2026-03-05 155637" src="https://github.com/user-attachments/assets/a32d2847-c168-47d0-b5cc-8ab0e78cf695" />
<img width="991" height="474" alt="Screenshot 2026-03-05 153225" src="https://github.com/user-attachments/assets/60e02c69-1ff0-4aeb-981d-cd2cd3c2ef03" />
<img width="588" height="224" alt="Screenshot 2026-03-05 181514" src="https://github.com/user-attachments/assets/a6841fe6-5d77-47ed-86b7-69397c97ce0e" />
