#!/bin/bash

kafka-topics \
    --bootstrap-server localhost:9092 \
    --delete \
    --topic kafka-demo-topic-infinite

kafka-topics \
    --bootstrap-server localhost:9092 \
    --delete \
    --topic kafka-demo-topic-compacted
