#!/bin/bash

java -DTOPIC=kafka-demo-topic-infinite -jar -Dspring.kafka.consumer.group-id=consumer-infinite-1 ../build/libs/kafka-consumer-0.0.1-SNAPSHOT.jar