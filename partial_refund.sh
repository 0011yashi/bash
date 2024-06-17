#!/bin/bash
echo "starting script"
input="$1"
while IFS= read -r line
do
 merchantOrderId=`echo $line | cut -d',' -f1`
 fulfilmentId=`echo $line | cut -d',' -f2`
 amount=`echo $line | cut -d',' -f3`
 merchantId=`echo $line | cut -d',' -f4`
 DATE=`date +'%Y-%m-%d %R:%S'`

 curl -X POST \
 'http://localhost:30000/transact/repay/reversal' \
 -H 'Content-Type: application/json' \
  -d '{
  "id": '${fulfilmentId}',
  "order_id": '${merchantOrderId}',
 "status": 17,
  "merchant_id": '${merchantId}',
  "created_at":"2020-02-06T17:00:00",
  "fulfillment_service_id": 45,
  "amount": '${amount}'
 }'
 echo "posting refund request for "$merchantOrderId
done < "$input"
