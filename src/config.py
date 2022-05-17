config = {
    'local': {
        'bootstrap_servers': 'localhost:9092',
        'kafkaMaxRequestSize': 50331648,
        'kafkaMaxMessageBytes': 50331648,
        'kafka_produce_topic': 'kafka-test',
        'fetch.wait.max.ms': 60000,
        'session.timeout.ms': 180000,
        'heartbeat.interval.ms': 60000,
        'queue.buffering.max.ms': 0,
        'queue.buffering.max.messages': 15000
    }
}

def getConfigForEnv(environment):
    return config[environment]
