#!/bin/bash

set -e

echo "Creating namespace (if not exists)..."
# Check if the namespace exists, if not create it
kubectl create namespace full-stack-deployment || true

echo "Deploying to MicroK8s with Helm..."
# Upgrade or install the release
helm upgrade --install full-stack-kubernetes ./full-stack-kubernetes \
  --namespace full-stack-deployment

echo "Deployment complete."
