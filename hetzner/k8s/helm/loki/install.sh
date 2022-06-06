helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install loki --namespace monitoring \
             --create-namespace grafana/loki -f values.yaml \
             --version 2.12.0 --atomic --timeout 240s
