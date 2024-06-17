#!/bin/bash
echo "starting script"
input="$1"
while IFS= read -r line
do
 cust=`echo $line | cut -d',' -f1`
 lan=`echo $line | cut -d',' -f2`
 amount=`echo $line | cut -d',' -f3`
 #DATE=`date +'%Y-%m-%d %R:%S'`
 #echo "posting refund request for "$DATE

echo "
curl --location --request POST 'http://localhost:9010/lms/loan/settlement/credit' \
--header 'Content-Type: application/json' \
--header 'cache-control: no-cache' \
--header 'lan: '${lan}'' \
--header 'userid: '${cust}'' \
--data '{
  \"amount\": '${amount}',
  \"reference_id\": \"LOC-129849\",
  \"value_date\": \"2024-01-05 12:31:00\",
  \"waiver_type\": \"Charge\",
  \"type\": \"GENERAL_WAIVER\",
  \"isForeclosure\": false
}'" 


done < "$input"
