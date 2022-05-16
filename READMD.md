# Kafka - KEDA - python

## Local Environment

### generate configs

```bash
$ cp .env.local .env
```

### Install Python dependencies

```bash
$ PIPENV_VENV_IN_PROJECT=true pipenv install --python 3.7
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
