Summary

---

````markdown
# EKS and Jenkins Setup using Terraform

This guide explains how I deployed an **EKS cluster** and an **Ubuntu server** on AWS Free Tier using **Terraform**, and configured **GitHub Actions** for CI/CD integration.

---

## 📁 Repository

**GitHub Link:** [k8s_-_jenkins_setup](https://github.com/kushall1845/k8s_-_jenkins_setup.git)

---

## 🚀 EKS Deployment

Since my laptop doesn’t support Minikube, I used AWS EKS for Kubernetes setup.  
The EKS cluster and an Ubuntu server were both provisioned using Terraform.

---

## 🔑 Adding Credentials to GitHub Secrets

After successful provisioning of EKS:

1. Opened the GitHub repository.
2. Navigated to **Settings → Actions → New repository secret**.
3. Added the following credentials:
   - DockerHub credentials  
   - AWS credentials

---

## ⚙️ Triggering GitHub Actions

To trigger the GitHub Actions workflow, I made a **dummy commit**, for example:
- Modified and committed something in the `README.md` file.

This triggered the CI/CD pipeline configured in the GitHub Actions workflow file.

---

## 💻 Ubuntu Server Setup

The **Ubuntu server** (deployed along with EKS) already had **AWS CLI** and **kubectl** pre-installed.

After logging into the Ubuntu server:

### 1. Configure AWS CLI
```bash
aws configure
````

### 2. Get Kubernetes Credentials

```bash
aws eks --region us-east-2 update-kubeconfig --name kushal_01-cluster
```

---

## 🌐 Ingress Controller Configuration

To get the **Ingress Controller DNS**:

```bash
kubectl get svc -n ingress-nginx
```

To get the **IP address** using the DNS:

```bash
nslookup <ingress_controller_dns>
```

Then edit the `/etc/hosts` file:

```bash
sudo vim /etc/hosts
```

Add the following entry:

```
<ingress_controller_ip> wisecow.local
```

`wisecow.local` is a **fake DNS name** created for testing the TLS-secured connection locally.

---

## 🔒 Testing TLS Secure Connection

To verify that the **Wisecow application** supports HTTPS:

```bash
curl -k https://wisecow.local
```

If the setup is successful, you should receive a valid response over a **TLS-secured connection**.

---

## ✅ Summary

* EKS and Ubuntu were deployed using Terraform on AWS Free Tier.
* Configured GitHub Secrets for CI/CD automation.
* Used the Ubuntu server for managing Kubernetes resources.
* Created a fake DNS (`wisecow.local`) for local TLS verification.

```


