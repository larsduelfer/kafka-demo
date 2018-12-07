package de.novatecgmbh.demo;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.stereotype.Component;

@Component
public class MessageConsumer {

  private static final Logger LOGGER = LoggerFactory.getLogger(MessageConsumer.class);

  @Value("${TOPIC}")
  private String topic;

  private int numberOfMessage = 1;

  @KafkaListener(topics = "${TOPIC}")
  public void consumer(ConsumerRecord<String, String> record, Acknowledgment ack) {
    LOGGER.info(
        "Message consumed from topic {}: {} {} - Message Number: {} - Offset: {}",
        topic,
        record.key(),
        record.value(),
        numberOfMessage++,
        record.offset());
    ack.acknowledge();
  }
}
