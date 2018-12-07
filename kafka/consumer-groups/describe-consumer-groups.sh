#!/bin/bash

echo "-------------------- Consumer Group for compacted topic --------------------"

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --group consumer-compacted \
    --describe

echo
echo "-------------------- Consumer Group 1 for infinite topic --------------------"

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --group consumer-infinite-1 \
    --describe

echo
echo "-------------------- Consumer Group 2 for infinite topic --------------------"

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --group consumer-infinite-2 \
    --describe