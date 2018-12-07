#!/bin/bash

PARTITION=$1

if [[ -z $PARTITION ]]; then
    echo -n "Partitions: "
    read PARTITION
fi

kafka-topics \
    --zookeeper localhost:2181 \
    --create \
    --if-not-exists \
    --topic kafka-demo-topic-infinite \
    --partitions "$PARTITION" \
    --replication-factor 1 \
    --config retention.ms=-1

kafka-topics \
    --zookeeper localhost:2181 \
    --create \
    --if-not-exists \
    --topic kafka-demo-topic-compacted \
    --partitions "$PARTITION" \
    --replication-factor 1 \
    --config retention.ms=-1 \
    --config cleanup.policy=compact \
    --config delete.retention.ms=5000 \
    --config min.cleanable.dirty.ratio=0 \
    --config segment.bytes=1024 \
    --config segment.ms=5000

