# 🚀 Full-Stack DevOps Project: React + Flask + PostgreSQL + Redis on Kubernetes

This project is a full-stack web application built to demonstrate end-to-end DevOps skills. It includes containerization with Docker, orchestration using Kubernetes (via Helm), CI/CD with GitHub Actions, monitoring via Prometheus & Grafana, and real-time alerting through Slack.

---

## 🧱 Tech Stack

- **Frontend:** React
- **Backend:** Flask (Python)
- **Database:** PostgreSQL
- **Caching Layer:** Redis
- **Reverse Proxy:** NGINX
- **Containerization:** Docker
- **Orchestration:** Kubernetes (MicroK8s)
- **Deployment Management:** Helm
- **CI/CD:** GitHub Actions with self-hosted runner
- **Monitoring:** Prometheus & Grafana
- **Alerting:** Alertmanager with Slack integration

---

## 🌐 Application Flow

```text
[React Frontend] 
       ↓
[NGINX Reverse Proxy]
       ↓
[Flask Backend]
       ↓
[Redis Cache] ⇄ [PostgreSQL Database]
```

## ⚙️ Features

    🐳 Containerized frontend, backend, and services

    ☸️ Kubernetes-native deployment with Helm charts

    🔁 CI/CD pipeline with GitHub Actions + Docker Hub integration

    📊 Observability via Prometheus, Grafana dashboards

    🚨 Slack alerts through Alertmanager on key metrics

    💻 Local-first setup using MicroK8s

## 🚀 Getting Started
Prerequisites

    Docker

    MicroK8s

    Helm

    kubectl

    GitHub CLI (optional)  
  
## 🔧 Setup Instructions  

1. Clone the Repository

```bash
git clone https://github.com/oyewoledavid/full-stack-kubernetes.git
cd devops-full-stack-kubernetes
``` 

2. Deploy to MicroK8s with Helm

```bash
helm install full-stack-kubernetes /full-stack-kubernetes
```

## 🔁 CI/CD Pipeline

This project uses GitHub Actions with a self-hosted runner to automate:

    Code linting and formatting checks

    Building and pushing Docker images

    Triggering Kubernetes deployment via kubectl


## 📈 Monitoring & Alerts

    Prometheus collects metrics from the app and cluster.

    Grafana displays dashboards for CPU, memory, HTTP response time.

    Alertmanager notifies via Slack for critical thresholds.

Slack alerts are triggered on:

    High memory usage

    Pod restarts

    HTTP errors

📸 Screenshots

 ![Frontend](/images/Client.png)
 ![Prometheus UI](/images/prometheus.png)
 ![Alert](/images/Alert.png)
 ![Grafana](/images/grafana1.png)
 ![Grafana](/images/grafana2.png)
 ![CI/CD](/images/CD.png)



🧑‍💻 Author  
David Oyewole
