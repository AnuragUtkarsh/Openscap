#!/bin/bash

# ==============================
# OpenSCAP CIS Compliance Script
# ==============================

CONTENT="/opt/scap-security-guide-0.1.79/ssg-ubuntu2204-ds.xml"
PROFILE="xccdf_org.ssgproject.content_profile_cis_level1_server"

BASE_DIR="/root/openscap-compliance"
REPORT_DIR="$BASE_DIR/reports"
LOG_DIR="$BASE_DIR/logs"

DATE=$(date +"%Y-%m-%d_%H-%M")

RESULT="$REPORT_DIR/results_$DATE.xml"
REPORT="$REPORT_DIR/report_$DATE.html"
LOGFILE="$LOG_DIR/scan.log"

mkdir -p $REPORT_DIR
mkdir -p $LOG_DIR

echo "=====================================" | tee -a $LOGFILE
echo "OpenSCAP CIS Scan Started: $(date)" | tee -a $LOGFILE
echo "=====================================" | tee -a $LOGFILE

echo "Running OpenSCAP scan..."

oscap xccdf eval \
--profile $PROFILE \
--results $RESULT \
--report $REPORT \
$CONTENT

echo "Scan completed." | tee -a $LOGFILE

# ==============================
# Calculate Compliance
# ==============================

TOTAL=$(grep -c "<rule-result" $RESULT)
PASS=$(grep -c "<result>pass</result>" $RESULT)
FAIL=$(grep -c "<result>fail</result>" $RESULT)

if [ "$TOTAL" -gt 0 ]; then
    PERCENT=$((PASS * 100 / TOTAL))
else
    PERCENT=0
fi

echo "-------------------------" | tee -a $LOGFILE
echo "Total Rules : $TOTAL" | tee -a $LOGFILE
echo "Passed      : $PASS" | tee -a $LOGFILE
echo "Failed      : $FAIL" | tee -a $LOGFILE
echo "Compliance  : $PERCENT%" | tee -a $LOGFILE
echo "Report File : $REPORT" | tee -a $LOGFILE
echo "-------------------------" | tee -a $LOGFILE

# ==============================
# Email Alert (Optional)
# ==============================

EMAIL="anuragutkarsh8681@gmail.com"

BODY="CIS Compliance Scan Report

Hostname: $(hostname)
Date: $(date)

Total Rules: $TOTAL
Passed: $PASS
Failed: $FAIL
Compliance: $PERCENT%

HTML report attached.
"

echo "$BODY" | mail -s "OpenSCAP CIS Compliance - $(hostname)" -A $REPORT $EMAIL

echo "Email alert sent." | tee -a $LOGFILE

echo "Scan finished successfully." | tee -a $LOGFILE
