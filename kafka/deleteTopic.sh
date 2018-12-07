#!/bin/bash

kafka-topics \
    --zookeeper localhost:2181 \
    --delete \
    --topic kafka-demo-topic-infinite

kafka-topics \
    --zookeeper localhost:2181 \
    --delete \
    --topic kafka-demo-topic-compacted
