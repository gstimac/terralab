helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install nginx-ingress-controller --namespace ingress-nginx \
             --create-namespace ingress-nginx/ingress-nginx -f values.yaml \
             --version 4.1.3 --atomic --timeout 120s
