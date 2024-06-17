#!/bin/bash
set -x
DIR=/home/yashasavi.gupta/
cd ${DIR}
cat date.csv | while read line;
do
date=`echo $line`
echo "Billing started for $date" >> ${DIR}/billing.log
	cat lan.csv | while read line;
	do
	lan=`echo $line`
echo "curl -v --location --request POST 'localhost:9010/lms/loan/settlement/internal/applyAmortSingle?loan_account_number='$lan'&job_date='$date''" >> ${DIR}/curl.log
	done
echo "Billing completed for $date and $lan" >> ${DIR}/billing.log
done
