# Kafka - KEDA - python

## Local Environment

### generate configs

```bash
$ cp .env.local .env
```

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

### Activate virtual environment

```bash
$ pipenv shell
```

### setup infra

```bash
$ ./minikube/setup.sh
```

### delete infra

```bash
$ minikube delete -p shiba
```
