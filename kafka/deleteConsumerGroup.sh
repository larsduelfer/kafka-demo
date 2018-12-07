#!/bin/bash

kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --delete \
    --group kafka-consumer