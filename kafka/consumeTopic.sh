#!/bin/bash

kafka-console-consumer \
    --bootstrap-server localhost:9092 \
    --topic kafka-demo-topic-infinite \
    --from-beginning \
    --group kafka-consumer-console \
    --property print.key=true \
    --property print.value=true
