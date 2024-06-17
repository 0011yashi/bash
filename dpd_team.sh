#!/bin/bash
> date
> dpd_output.log
d=30
while [ $d -ge 0 ]
do
echo `date --date="-$d days" '+%d-%m-%Y'` >> date
d=`expr $d - 1`
done
for lan in `cat lan`
do
for d in `cat date`
do
echo "Executing runDPDSingle and putting relevant entries in the dpd_audit for ${lan} for date - ${d} : " >> dpd_output.log
curl --location --request POST "http://localhost:9010/lms/loan/settlement/internal/runDPDSingle?start_date=${d}&end_date=${d}" \
--header "loan_account_number: ${lan}" >> dpd_output.log
echo -e "\n" >> dpd_output.log 
done
done