#!/bin/bash
# az login
# docker login

kubectl create namespace ado

kubectl create secret -n ado generic azdevops \
  --from-literal=AZP_URL=https://dev.azure.com/goranstimac \
  --from-literal=AZP_TOKEN=$(az keyvault secret show --id https://vaultlab.vault.azure.net/secrets/ado-pat/aac99d9bee77432d8b8195e47009ff29 | jq -r .value) \
  --from-literal=AZP_POOL=ADO-Keda-agents

kubectl create secret -n ado generic regcred \
    --from-file=.dockerconfigjson=/home/goran/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm upgrade --install --namespace keda --create-namespace keda kedacore/keda --set prometheus.metricServer.enabled=true --set prometheus.operator.enabled=true --set watchNamespace=ado

kubectl apply -f ado-agent-keda-dummy-agent.yaml -n ado
kubectl apply -f ado-agent-keda-job.yaml -n ado

#TODO https://github.com/kedacore/charts/blob/02d4688afe1cf15c122042a5597fc07aaf2f8715/keda/values.yaml#L115 expose to internal balancer k8s