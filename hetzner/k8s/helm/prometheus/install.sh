helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus-server --namespace monitoring \
             --create-namespace prometheus-community/prometheus -f values.yaml \
             --version 15.9.1 --atomic --timeout 120s
