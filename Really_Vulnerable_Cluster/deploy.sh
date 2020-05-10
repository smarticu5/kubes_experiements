kind create cluster --config cluster_config.yaml

# Create Dashboard
kubectl apply -f kubernetes_dashboard.yaml

# Add customisations
kubectl apply -f cluster_manifest.yaml

# Initialise Helm
helm init