#!/bin/bash

BROKERLIST='<kafka-ip>'

# Kafka Topic
TOPIC='<topic-name>'

# 100k Rows
# All data files
DATA='<path-to-data>'
TYPE='csv'
DELIM=','
DEBUG='false'

if [[ $1 ]]; then
  TOPIC=$1
fi

if [[ $2 ]]; then
  DATA=$2
fi

if [[ $3 ]]; then
  TYPE=$3
fi

if [[ $4 ]]; then
  DELIM=$4
fi

if [[ $5 ]]; then
  DEBUG=$5
fi

shopt -s nullglob

echo "Topic: $TOPIC"
echo "Data: $DATA"
echo "Brokers: $BROKERLIST"
echo "Delimiter: $DELIM"
echo ""

for f in $DATA/*.$TYPE
do
  echo "Processing $f file..."
  sed -n '2,$p' $f | \
  kafka-console-producer  --broker-list $BROKERLIST --topic $TOPIC 
done
