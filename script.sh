#!/bin/bash
set -e

NAMESPACE="wisecow"
CERT_NAME="wisecow-tls"
CRT_FILE="tls.crt"
KEY_FILE="tls.key"
MANIFEST_DIR="k8s_files"

echo "🔧 Creating namespace: $NAMESPACE"
kubectl create namespace $NAMESPACE || echo "Namespace $NAMESPACE already exists"

echo "🚀 Installing NGINX Ingress Controller on AWS"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/aws/deploy.yaml

echo "🔐 Generating self-signed TLS certificate for wisecow.local"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout $KEY_FILE -out $CRT_FILE \
  -subj "/CN=wisecow.local/O=Wisecow"

echo "📦 Creating TLS secret '$CERT_NAME' in namespace '$NAMESPACE'"
kubectl create secret tls $CERT_NAME \
  --cert=$CRT_FILE \
  --key=$KEY_FILE \
  --namespace=$NAMESPACE

echo "🧹 Cleaning up certificate files"
rm -f $CRT_FILE $KEY_FILE

echo "📦 Applying deployment.yaml"
kubectl apply -f $MANIFEST_DIR/01-deployment.yaml

echo "📡 Applying service.yaml"
kubectl apply -f $MANIFEST_DIR/02-service.yaml

echo "⏳ Sleeping for 30 seconds to allow LoadBalancer provisioning..."
sleep 30

echo "🌐 Applying ingress.yaml"
kubectl apply -f $MANIFEST_DIR/03-ingress.yaml

echo "✅ All resources applied successfully. TLS is active and Ingress is configured."