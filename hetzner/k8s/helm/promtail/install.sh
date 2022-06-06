helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install promtail --namespace monitoring \
             --create-namespace grafana/promtail -f values.yaml \
             --atomic --timeout 240s
