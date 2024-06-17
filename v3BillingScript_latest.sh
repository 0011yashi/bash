#!/bin/bash
echo "starting script"
input="$1"
while IFS= read -r line
do
 lan=`echo $line | cut -d',' -f1`
 echo "generating bill for "$lan

curl --location --request POST 'localhost:9010/lms/loan/settlement/internal/user/generateBill' \
--header 'lan: '${lan}'' \
--header 'billing_date: 2024-01-01' \
--header 'bypass_validation: false' 

echo "api call done for loan account "$lan
done < "$input"
