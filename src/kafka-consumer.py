import confluent_kafka

from config import getConfigForEnv

if __name__ == "__main__":
    config = getConfigForEnv("local")
    topic_name = config["kafka_produce_topic"]
    
    c = confluent_kafka.Consumer({
        'bootstrap.servers': config["bootstrap_servers"],
        'group.id': 'mygroup',
        'auto.offset.reset': 'earliest'
    })

    c.subscribe([config['kafka_produce_topic']])

    while True:
        msg = c.poll(1.0)

        if msg is None:
            continue
        if msg.error():
            print("Consumer error: {}".format(msg.error()))
            continue

        print('Received message: {}'.format(msg.value().decode('utf-8')))

    c.close()
