#!/bin/bash

NAMESPACE="efk"
RELEASE_NAME="kibana"

echo "Uninstalling Helm release: $RELEASE_NAME from namespace $NAMESPACE..."
helm uninstall "$RELEASE_NAME" -n "$NAMESPACE" || echo "Helm release not found."

echo "Deleting all Kubernetes resources in namespace: $NAMESPACE..."
kubectl delete all --all -n "$NAMESPACE" --ignore-not-found

echo "Deleting common Kubernetes resource types (CM, Secrets, PVCs, Roles, etc)..."
kubectl delete configmap,secret,pvc,role,rolebinding,serviceaccount,job -n "$NAMESPACE" --all --ignore-not-found

echo "Force-deleting any remaining Kibana resources by name or label..."
kubectl get all -n "$NAMESPACE" -l app.kubernetes.io/name=kibana -o name | xargs kubectl delete -n "$NAMESPACE" --ignore-not-found

echo "Deleting any lingering Kibana CRDs..."
kubectl get crds | grep kibana | awk '{print $1}' | xargs -r kubectl delete crd --ignore-not-found

# Optional: delete the namespace itself
read -p "Do you want to delete the entire '$NAMESPACE' namespace? This will remove everything in it. (y/N): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "Deleting namespace: $NAMESPACE"
  kubectl delete namespace "$NAMESPACE" --ignore-not-found
else
  echo "Skipping namespace deletion."
fi

echo "EFK cleanup complete."
