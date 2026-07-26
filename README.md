# EduArn SRE Demo – Prometheus, Grafana, NGINX & Chaos Engineering

A hands-on Site Reliability Engineering (SRE) demo environment built using Docker Compose. This project demonstrates monitoring, observability, service level indicators (SLIs), service level objectives (SLOs), error budget concepts, and chaos engineering using Prometheus, Grafana, NGINX, Node Exporter, cAdvisor, and Pumba.

---

## About EduArn

EduArn provides industry-focused technical training for individuals and organizations through instructor-led online, classroom, and corporate learning programs. Training is designed around practical labs, real-world projects, certification preparation, and modern DevOps, Cloud, AI, and Software Engineering practices. EduArn LMS+1


Learn more at:

EduArn Official Websiteeduarn.com

---

# Training Offered

## Retail (Individual) Training

Designed for students, job seekers, and working professionals.

### Popular Programs

- AWS Cloud
- Microsoft Azure
- Google Cloud Platform (GCP)
- DevOps
- Docker
- Kubernetes
- Terraform
- Jenkins
- Linux Administration
- Python
- Java
- AI & Machine Learning
- Generative AI
- MLOps
- Monitoring with Prometheus & Grafana
- Site Reliability Engineering (SRE)
- Data Engineering
- Cyber Security

Features

- Live Online Training
- Weekend Batches
- Classroom Training
- Self-paced Learning
- Hands-on Labs
- Real-world Projects
- Interview Preparation
- Certification Guidance
- Recorded Sessions

---

## Corporate Training

Customized enterprise learning solutions for organizations.

Training can be delivered:

- Online
- Onsite
- Hybrid

Corporate domains include:

- Cloud Migration
- DevOps Transformation
- Kubernetes
- Platform Engineering
- AI Adoption
- SRE
- Observability
- Security
- Automation
- Infrastructure as Code
- FinOps

Corporate offerings include:

- Skill Gap Assessment
- Customized Curriculum
- Lab Environment
- Project-based Learning
- Assessments
- Certification Preparation
- Progress Reports
- Post-training Support

---

# Project Architecture

```
                    Users
                      │
                      ▼
                 NGINX Web Server
                      │
        ┌─────────────┴─────────────┐
        │                           │
        ▼                           ▼
 NGINX Exporter               Node Exporter
        │                           │
        └─────────────┬─────────────┘
                      ▼
                 Prometheus
                      │
                      ▼
                  Grafana
                      │
                      ▼
             SLI / SLO Dashboard

              ▲
              │
            Pumba
     (Chaos Engineering)
```

---

# Technologies

- Docker Compose
- Prometheus
- Grafana
- NGINX
- NGINX Prometheus Exporter
- Node Exporter
- cAdvisor
- Pumba
- Linux
- PromQL

---

# SRE Concepts Covered

- Monitoring
- Observability
- Metrics Collection
- Dashboards
- Alerting Concepts
- SLI
- SLO
- Error Budget
- Chaos Engineering

---

# Sample PromQL Queries

## SLI

```promql
rate(nginx_http_requests_total[1m])
```

Measures the current request rate.

---

## SLO

```promql
rate(nginx_http_requests_total{job="nginx"}[1m]) >= bool 4
```

Example objective:

- Minimum 4 requests per second

Returns:

- 1 = SLO Met
- 0 = SLO Failed

---

## Error Budget (Demo)

```promql
clamp_min(
4 - rate(nginx_http_requests_total{job="nginx"}[1m]),
0
)
```

Shows how far the current throughput is below the target.

---

# Chaos Engineering

Generate traffic:

```bash
while true
do
curl http://localhost:8081
sleep 0.1
done
```

Pause NGINX:

```bash
docker run --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
gaiaadm/pumba pause \
--duration 60s demo-nginx
```

Observe in Grafana:

- SLI decreases
- SLO changes to Failed
- Error Budget increases

---

# Learning Outcomes

After completing this demo, learners will understand:

- Docker-based monitoring stack
- Prometheus metrics collection
- Grafana dashboards
- PromQL basics
- Infrastructure monitoring
- NGINX monitoring
- Linux monitoring
- Container monitoring
- SLI implementation
- SLO implementation
- Error Budget concepts
- Chaos Engineering fundamentals

---

# Ideal Audience

- DevOps Engineers
- Site Reliability Engineers (SRE)
- Cloud Engineers
- Platform Engineers
- Linux Administrators
- Software Engineers
- Infrastructure Engineers
- Students
- IT Professionals

---

# Contact

Website

Eduarn Official eduarn.com

Corporate & Retail Training

Eduarn Training eduarn.com

About Eduarn

About eduarn.com

Contact

Contact eduarn.com

---

© Eduarn – Corporate & Retail Training | AI | Cloud | DevOps | SRE | Kubernetes | Data Engineering | Professional Certification Programs
