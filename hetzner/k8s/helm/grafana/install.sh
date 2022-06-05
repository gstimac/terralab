helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install grafana --namespace monitoring \
             --create-namespace grafana/grafana -f values.yaml \
             --version 6.29.6 --atomic --timeout 120s
