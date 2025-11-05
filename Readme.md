# 📘 Accuknox Assignment

This repository contains solutions to the assignment provided by **Accuknox India Private Limited**.  
It is divided into two problem statements focused on containerization, deployment, and system monitoring.

---

## 🧩 Problem Statement 1: Wisecow App Deployment

**Project Repository:** [Wisecow App](https://github.com/nyrahul/wisecow)

**Objective:**  
Containerize and deploy the Wisecow application on a Kubernetes environment (e.g., Kind or Minikube) with secure TLS communication.

**Key Requirements:**
- Dockerize the application
- Set up Kubernetes manifests for deployment
- Configure TLS using self-signed certificates or a certificate manager
- Ensure the app is accessible via HTTPS

---

## 🛠️ Problem Statement 2: System Monitoring & Uptime Check

### 1. System Health Monitoring Script

**Objective:**  
Develop a script to monitor the health of a Linux system by checking:
- CPU usage
- Memory usage
- Disk space
- Running processes

**Behavior:**  
If any metric exceeds predefined thresholds (e.g., CPU usage > 80%), the script should:
- Log the alert to a file or
- Print the alert to the console

---

### 2. Application Uptime Checker

**Objective:**  
Create a script to check the uptime and availability of an application by:
- Sending HTTP requests
- Evaluating HTTP status codes

**Behavior:**  
- If the application responds with a valid status (e.g., 200 OK), it is considered **'up'**
- If the application fails to respond or returns an error code, it is considered **'down'**

---

