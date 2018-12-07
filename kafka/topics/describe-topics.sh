#!/bin/bash

kafka-topics \
    --zookeeper localhost:2181 \
    --describe \
    --topic kafka-demo-topic-infinite

kafka-topics \
    --zookeeper localhost:2181 \
    --describe \
    --topic kafka-demo-topic-compacted
