#!/bin/bash

java -DTOPIC=kafka-demo-topic-compacted -jar -Dspring.kafka.consumer.group-id=consumer-compacted ../build/libs/kafka-consumer-0.0.1-SNAPSHOT.jar