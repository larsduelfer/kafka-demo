package de.novatecgmbh.demo;

import org.apache.kafka.clients.producer.ProducerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.UUID;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class MessageProducer {

  private static final Logger LOGGER = LoggerFactory.getLogger(MessageProducer.class);

  @Value("${TOPIC}")
  private String topic;

  @Autowired KafkaTemplate<String, String> kafkaTemplate;

  @Scheduled(fixedDelay = 1000L)
  public void produceToInfititeTopic() {
    assert topic == null: "No Topic specified";
    this.produce(topic);
  }

  private void produce(String topic) {
    Stream.iterate(0, i -> i + 1)
        .limit(10)
        .map(
            (index) ->
                new ProducerRecord<String, String>(
                    topic, String.valueOf(index), UUID.randomUUID().toString()))
        .map(kafkaTemplate::send)
        .collect(Collectors.toList())
        .forEach(
            sendFuture -> {
              try {
                ProducerRecord record = sendFuture.get().getProducerRecord();
                LOGGER.info(
                    "Message sent to topic {}: {}, {}", topic, record.key(), record.value());
              } catch (InterruptedException | ExecutionException ex) {
                throw new IllegalStateException(ex);
              }
            });
  }
}
