# High Availability Linux Cluster (HA) – Sin Kubernetes

## 📌 Descripción

Este proyecto implementa un cluster de Alta Disponibilidad (HA) clásico en Linux utilizando tecnologías tradicionales de infraestructura sin Kubernetes.

El objetivo es diseñar una arquitectura que garantice:

- Balanceo de carga
- Failover automático
- Alta disponibilidad de servicios web
- Base de datos replicada
- Eliminación de puntos únicos de fallo


## 🏗 Arquitectura

Clientes → IP Virtual (Keepalived) → HAProxy (LB1/LB2) → Nginx (WEB1/WEB2) → PostgreSQL (Primary/Replica)


## ⚙ Tecnologías utilizadas

- Debian 13
- HAProxy
- Keepalived (VRRP)
- Nginx
- PostgreSQL (Streaming Replication)
- VirtualBox


## 🔁 Características principales

- Balanceo L7 Round Robin
- Health Checks automáticos
- Failover automático ante caída del Load Balancer
- Replicación en tiempo real de base de datos
- Infraestructura totalmente reproducible


## 🧪 Pruebas realizadas

- Simulación de caída de LB primario
- Simulación de caída de servidor web
- Validación de replicación PostgreSQL
- Comprobación de IP Virtual activa


## 📂 Estructura del proyecto

cluster-ha-linux/
│
├── docs/              → Documentación técnica paso a paso
├── configs/           → Archivos de configuración (HAProxy, Keepalived, Nginx, DB)
├── scripts/           → Scripts de automatización y pruebas
├── diagrams/          → Diagramas de arquitectura
├── screenshots/       → Evidencias visuales del funcionamiento
├── anexos/            → Troubleshooting y mejoras futuras
└── README.md


## 👨‍💻 Autor

<div align="left"> <img src="https://img.shields.io/badge/Raúl%20Gutiérrez-blue?style=for-the-badge&logo=github" alt="Autor"> <a href="https://www.linkedin.com/in/raúl-gutiérrez-354073320" target="_blank"> <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"> </a> <br><br>
  
  **🎓 Formación:** ASIR  
  **📅 Año:** 2026  
  **🛠️ Especialidad:** Administración de Sistemas y Cloud Computing
</div>