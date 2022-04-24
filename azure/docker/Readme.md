docker buildx build \                                            
    -f ./azure-devops-agent-Dockerfile --platform linux/arm/v7,linux/amd64 \
    -t goranstimac/azure-devops-agent:basic \
    --push .