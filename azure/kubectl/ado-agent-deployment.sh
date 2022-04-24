#!/bin/bash
# az login
# docker login

kubectl create namespace ado

kubectl create secret -n ado generic azdevops \
  --from-literal=AZP_URL=https://dev.azure.com/goranstimac \
  --from-literal=AZP_TOKEN=$(az keyvault secret show --id https://gs-lab-vault.vault.azure.net/secrets/ado-pat/6a44124e262444019e0c9f4c34de780b | jq -r .value) \
  --from-literal=AZP_POOL=ADO-Keda-agents

kubectl create secret -n ado generic azdevops-large \
  --from-literal=AZP_URL=https://dev.azure.com/goranstimac \
  --from-literal=AZP_TOKEN=$(az keyvault secret show --id https://gs-lab-vault.vault.azure.net/secrets/ado-pat/6a44124e262444019e0c9f4c34de780b | jq -r .value) \
  --from-literal=AZP_POOL=ADO-Keda-agents-large

kubectl create secret -n ado generic regcred \
    --from-file=.dockerconfigjson=/home/goran/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create namespace keda
helm install keda kedacore/keda --namespace keda

#kubectl apply -f ado-agent-keda-dummy-agent.yaml -n ado
#kubectl apply -f ado-agent-keda-dummy-agent-large.yaml -n ado
kubectl apply -f ado-agent-keda-job.yaml -n ado
kubectl apply -f ado-agent-large-keda-job.yaml -n ado