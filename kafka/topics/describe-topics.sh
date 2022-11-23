#!/bin/bash

kafka-topics \
    --bootstrap-server localhost:9092 \
    --describe \
    --topic kafka-demo-topic-infinite

kafka-topics \
    --bootstrap-server localhost:9092 \
    --describe \
    --topic kafka-demo-topic-compacted
