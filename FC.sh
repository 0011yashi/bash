#!/bin/bash
set -x
cat LAN.csv | tail -n+2 | while read line;
do
lan=`echo $line | awk -F ',' '{print $1}'`
totalbal=`curl --location --request GET 'http://localhost:9010/lms/loan/settlement/foreclosure/charges' --header 'x-user-id: 191462225' --header 'sso_token: 1222' --header 'lan: '$lan'' --header 'Content-Type: application/json' --header 'skip_foreclosure_applicable_check: True'  | sed -e 's/.*total"://g' -e 's/}}]}//g'`
echo "$lan,$totalbal" >> modified_loan_account_number.csv
done


#!/bin/bash
set -x
cat LAN.csv | tail -n+2 | while read line;
do
lan=`echo $line | awk -F ',' '{print $1}'`
totalbal=`curl --location --request GET 'http://localhost:9010/lms/loan/settlement/foreclosure/charges' --header 'x-user-id: 191462225' --header 'sso_token: 1222' --header 'lan: '$lan'' --header 'Content-Type: application/json' --header 'foreclosure_charge_applicable: false' | sed -e 's/.*total"://g' -e 's/}}]}//g'`
echo "$lan,$totalbal" >> modified_loan_account_number.csv
done



curl --location --request GET 'http://localhost:9010/lms/loan/settlement/foreclosure/charges' \
--header 'Content-Type: application/json' \
--header 'lan: PYTMPLHD10356503240'

curl --location 'http://localhost:9010/lms/loan/settlement/foreclosure/charges' \
--header 'Content-Type: application/json' \
--header 'lan: PYTMPLHD10356503240' \
--header 'skip_foreclosure_applicable_check: True' 
