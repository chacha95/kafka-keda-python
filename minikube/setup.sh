### INSTALL UTILITIES
# minikube
if ! command -v minikube &> /dev/null
then
  echo "install minikube from https://minikube.sigs.k8s.io/docs/start/"
  exit 1
fi
# kubectl
if ! command -v kubectl &> /dev/null
then
  echo "install kubectl from https://kubernetes.io/docs/tasks/tools/"
  exit 1
fi
# helm
if ! command -v helm &> /dev/null
then
  echo "install helm from https://helm.sh/docs/intro/install/"
  exit 1
fi

helm repo add confluentinc https://confluentinc.github.io/cp-helm-charts/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# configure .env
# export $(cat .env | xargs) 2> /dev/null

minikube start -p shiba --memory 8g --cpus 4 --addons=metrics-server --kubernetes-version=v1.22.3

### NAMESPACES
kubectl apply -f minikube/namespaces.yaml

################# KAFKA #################
kubectl config set-context --current --namespace=kafka
### DEPLOY KAFKA CLUSTER
helm install kafka confluentinc/cp-helm-charts -f minikube/kafka/cluster/confluentinc-cp-helm-charts.yaml
sleep 10

### Wait for pods
echo 'waiting for kafka pod to be ready'
kubectl wait -n kafka po -l release=kafka --for=condition=ready --timeout=-1s
echo 'waiting for connect pod to be ready'
kubectl wait -n kafka po -l release=connect --for=condition=ready --timeout=-1s