# Behind a proxy
# docker run -d --restart=unless-stopped --privileged \
# -p 127.0.0.1:8088:80 -p 127.0.0.1:8443:443 \
# -v /root/rancher:/var/lib/rancher \
# -v /etc/ssl/certs:/container/certs \
# -e SSL_CERT_DIR="/container/certs" \
# -e HTTP_PROXY="http://k8s.gshl.xyz" \
# -e HTTPS_PROXY="https://k8s.gshl.xyz" \
# -e NO_PROXY="localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,cattle-system.svc,192.168.10.0/24,.svc,.cluster.local,.gshl.xyz,65.21.187.223,rancher.io" \
# --name rancher-server \
# rancher/rancher:latest


# On a public ip with letsencrypt
docker run -d --restart=unless-stopped --privileged \
-p 8800:80 -p 8443:443 \
-v /root/rancher:/var/lib/rancher \
-v /etc/letsencrypt/live/k8s.gshl.xyz/fullchain.pem:/etc/rancher/ssl/cert.pem \
-v /etc/letsencrypt/live/k8s.gshl.xyz/privkey.pem:/etc/rancher/ssl/key.pem \
--name rancher-server \
rancher/rancher:latest \
--no-cacerts

docker logs  <containerid>  2>&1 | grep "Bootstrap Password:"
