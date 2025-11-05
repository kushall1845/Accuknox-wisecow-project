
---

# EKS Setup using Terraform

This document explains how I deployed an EKS cluster and an Ubuntu server on AWS Free Tier using Terraform, and configured GitHub Actions for CI/CD integration.

GitHub Repository:
[https://github.com/kushall1845/k8s_-_jenkins_setup.git](https://github.com/kushall1845/k8s_-_jenkins_setup.git)

---

## EKS Deployment

Since my laptop doesn’t support Minikube, I used AWS EKS for Kubernetes setup.
The EKS cluster and an Ubuntu server were both provisioned using Terraform.

After successful provisioning of EKS, I added DockerHub and AWS credentials to GitHub Secrets:

1. Opened the GitHub repository.
2. Clicked on Settings → Actions → New repository secret.
3. Added the required credentials.

---

## Triggering GitHub Actions

To trigger the GitHub Actions workflow, I made a dummy commit (for example, modified and committed something in the README.md file).
This triggered the CI/CD pipeline defined in the GitHub Actions workflow.

---

## Ubuntu Server Setup

The Ubuntu server deployed along with EKS already had AWS CLI and kubectl pre-installed.
After logging into the Ubuntu server, I performed the following steps:

1. Configure AWS credentials
   Command:
   aws configure

2. Get Kubernetes credentials
   Command:
   aws eks --region us-east-2 update-kubeconfig --name kushal_01-cluster

---

## Ingress Controller Configuration

To get the Ingress Controller DNS:
kubectl get svc -n ingress-nginx

To get the IP address using the DNS:
nslookup <ingress_controller_dns>

Then opened the hosts file:
sudo vim /etc/hosts

Added the following entry:
<ingress_controller_ip> wisecow.local

Here, wisecow.local is a fake DNS name created for testing TLS secure connection locally.

---

## Verifying TLS Secure Connection

To confirm whether the Wisecow application supports TLS secure connection:
curl -k [https://wisecow.local](https://wisecow.local)

If everything is configured correctly, this command should show a valid HTTPS response.

---

## Summary

* Deployed **EKS cluster** and **Ubuntu server** using Terraform on AWS Free Tier.
* Configured **DockerHub** and **AWS credentials** in GitHub Secrets for CI/CD integration.
* Triggered GitHub Actions workflow through a dummy commit.
* Used the Ubuntu server (with pre-installed AWS CLI and kubectl) to manage Kubernetes resources.
* Set up a fake DNS entry (`wisecow.local`) for local TLS testing.
* Verified secure HTTPS access using the `curl -k https://wisecow.local` command.

---


