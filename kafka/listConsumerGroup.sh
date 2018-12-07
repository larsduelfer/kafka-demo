#!/bin/bash

watch kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --list