#!/bin/bash

# ==============================
# OpenSCAP CIS Auto Remediation
# ==============================

CONTENT="/opt/scap-security-guide-0.1.79/ssg-ubuntu2204-ds.xml"
PROFILE="xccdf_org.ssgproject.content_profile_cis_level1_server"

BASE_DIR="/root/openscap-compliance"
REPORT_DIR="$BASE_DIR/reports"
LOG_DIR="$BASE_DIR/logs"

DATE=$(date +"%Y-%m-%d_%H-%M")

RESULT="$REPORT_DIR/remediation_results_$DATE.xml"
REPORT="$REPORT_DIR/remediation_report_$DATE.html"
LOGFILE="$LOG_DIR/remediation.log"

mkdir -p $REPORT_DIR
mkdir -p $LOG_DIR

echo "=====================================" | tee -a $LOGFILE
echo "OpenSCAP Remediation Started: $(date)" | tee -a $LOGFILE
echo "=====================================" | tee -a $LOGFILE

echo "Applying CIS remediation..."

oscap xccdf eval \
--profile $PROFILE \
--remediate \
--results $RESULT \
--report $REPORT \
$CONTENT

echo "Remediation completed." | tee -a $LOGFILE

# ==============================
# Compliance Calculation
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

echo "Remediation process finished." | tee -a $LOGFILE
