#!/bin/bash

set -x

DIR=/home/yashasavi.gupta/

cd ${DIR}

rm -rf ${DIR}/InterestAccrualJob.log

cat date.csv | while read line;

do

date=`echo $line`
echo "Interest Accural started for $date" >> ${DIR}/InterestAccrualJob.log

	cat lan.csv | while read line;

	do

	lan=`echo $line`

	curl --location --request POST 'http://localhost:9010/lms/loan/settlement/internal/apply/interestaccrual/account?job_date='$date'&loan_account_number='$lan''

	done

echo "Interest Accural completed for $date" >> ${DIR}/InterestAccrualJob.log

done
