#!/usr/bin/env bash

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --group consumer-compacted \
    --reset-offsets \
    --to-earliest \
    --execute \
    --all-topics

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --group consumer-infinite \
    --reset-offsets \
    --to-earliest \
    --execute \
    --all-topics
