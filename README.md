# Cluster HA en Linux con HAProxy y Keepalived

Proyecto de implementación de un cluster de alta disponibilidad en sistemas Linux, utilizando HAProxy para balanceo de carga, Keepalived para failover automático mediante VRRP, Nginx como servidor web y base de datos replicada para garantizar continuidad del servicio.

## 📌 Descripción

Este proyecto tiene como objetivo el diseño e implementación de una infraestructura de alta disponibilidad (High Availability) en entornos Linux sin utilizar Kubernetes.

La solución permite:

- Balancear tráfico HTTP entre múltiples servidores web

- Garantizar failover automático mediante IP virtual (VRRP)

- Mantener disponibilidad del servicio ante caída de nodos

- Replicar base de datos para asegurar integridad y continuidad de datos

- Realizar pruebas reales de tolerancia a fallos

Proyecto personal enfocado en la administración avanzada de sistemas Linux, redes y alta disponibilidad, diseñado para demostrar conocimientos sólidos en clustering tradicional, balanceo de carga y continuidad de servicio en entornos productivos.

## 🛠️ Tecnologías utilizadas

- Debian 13

- HAProxy

- Keepalived (VRRP)

- Nginx

- PostgreSQL (replicación primaria-secundaria)

- Bash scripting

- Virtualización (VirtualBox)

- Git y GitHub

## 📂 Estructura del proyecto

La estructura del repositorio está organizada por fases de desarrollo y componentes del sistema:

- `docs/` → Documentación técnica del proyecto (PASO A PASO)

- `configs/` → Archivos de configuración (HAProxy, Keepalived, Nginx, DB)

- `scripts/` → Scripts de automatización y pruebas de failover

- `diagrams/` → Diagramas de arquitectura

- `screenshots/` → Evidencias visuales del funcionamiento

- `anexos/` → Troubleshooting y mejoras futuras

## 🧪 Pruebas de Alta Disponibilidad

El entorno ha sido sometido a simulaciones reales de fallo:

- Caída del nodo balanceador principal → Transferencia automática de la IP virtual al nodo secundario.
- Caída de un servidor web → Exclusión automática del backend desde HAProxy.
- Caída de base de datos primaria → Continuidad del servicio mediante réplica.

Las evidencias se encuentran en `screenshots/`.

## 📄 Autor

<div align="left"> <img src="https://img.shields.io/badge/Raúl%20Gutiérrez-blue?style=for-the-badge&logo=github" alt="Autor"> <a href="https://www.linkedin.com/in/raúl-gutiérrez-354073320" target="_blank"> <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"> </a> <br><br>
  
  **🎓 Formación:** ASIR  
  **📅 Año:** 2026  
  **🛠️ Especialidad:** Administración de Sistemas y Cloud Computing
</div>