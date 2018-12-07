#!/bin/bash

echo "-------------------------------------------------"
echo "PLEASE remember to add a host mapping as follows:"
echo "-------------------------------------------------"
echo "For Linux, please add the following line to /etc/hosts"
echo "127.0.0.1 broker"
echo "-------------------------------------------------"
echo "For Windows, please add the following line to %systemroot%/system32/drivers/etc/hosts"
echo "10.0.2.2 broker"
echo "-------------------------------------------------"
echo "This is required for the kafka producers and consumers to find the kafka broker."
echo "-------------------------------------------------"

docker-compose -f docker-compose.yml up -d
