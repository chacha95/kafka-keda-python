# Kafka - KEDA - python

## Local Environment

### generate configs

### Install Python dependencies in mac M1

install `librdkafka`

```bash
$ cd ~ && mkdir tmp && cd tmp
$ git clone https://github.com/edenhill/librdkafka.git
$ cd librdkafka
$ ./configure --install-deps
$ brew install  openssl zstd pkg-config
$ ./configure
$ make
$ sudo make install
```

install python package using pipenv

```bash
$ PIPENV_VENV_IN_PROJECT=true pipenv install --python 3.7.12
```

### Install Python dependencies in mac intell

install `librdkafka`

```bash
$ brew install librdkafka
```

install python package using pipenv

```bash
$ PIPENV_VENV_IN_PROJECT=true pipenv install --python 3.7.12
```

### setup infra

```bash
$ ./minikube/setup.sh
```

### Activate virtual environment

```bash
$ pipenv shell
```

### test kafka producer & consumer work

```bash
# python src/python_kafka_test_client.py <IP:PORT>
$ python src/python_kafka_test_client.py localhost:9092
```

### delete infra

```bash
$ minikube delete -p shiba
```
