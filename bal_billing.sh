#!/bin/bash

set -x

cd /home/yashasavi_46595/

rm -rf modified_loan_account_number.csv

cat loan_account_number_billing.csv | while read line;

do

lan=`echo $line | awk -F ',' '{print $1}'`
abcd=`echo $line | awk -F ',' '{print $2}'`

curl -v --location --request POST 'localhost:9010/lms/loan/settlement/internal/applyAmortSingle?loan_account_number='$lan'&job_date='$abcd''
curl -L -X POST 'http://localhost:9010/lms/loan/settlement/internal/recalculateLoanAccountDues' -H 'loan_account_number:'$lan''

done
