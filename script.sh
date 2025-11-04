#!/bin/bash
set -e

NAMESPACE="wisecow"

echo "🔧 Creating namespace: $NAMESPACE"
kubectl create namespace $NAMESPACE

echo "🚀 Installing NGINX Ingress Controller on AWS"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/aws/deploy.yaml

echo "🔐 Generating self-signed TLS certificate for wisecow.local"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout tls.key -out tls.crt \
  -subj "/CN=wisecow.local/O=Wisecow"

echo "📦 Creating TLS secret in namespace $NAMESPACE"
kubectl create secret tls wisecow-tls \
  --cert=tls.crt \
  --key=tls.key \
  --namespace=$NAMESPACE

echo "✅ TLS setup complete. You can now configure your Ingress resource to use 'wisecow-tls' for HTTPS."