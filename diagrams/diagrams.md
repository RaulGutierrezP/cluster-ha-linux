# Diagramas de Arquitectura

## 🎯 Objetivo

Esta sección contiene los **diagramas de arquitectura** del proyecto de **Cluster de Alta Disponibilidad en Linux**, utilizados para representar de forma visual la distribución de nodos, roles y flujos de comunicación entre los distintos componentes del sistema.

Los diagramas facilitan la comprensión del diseño y sirven como referencia técnica para mantenimiento, auditorías o ampliaciones futuras.

---

## 🧱 Arquitectura General del Cluster

El entorno está compuesto por:

- **2 balanceadores** (HAProxy + Keepalived)
- **2 servidores web** (Nginx)
- **2 servidores de base de datos** (PostgreSQL Primary / Replica)
- **1 IP Virtual (VIP)** gestionada por VRRP

El tráfico sigue el siguiente flujo:

1. El cliente accede a la **IP Virtual**
2. Keepalived garantiza que la VIP esté activa en un único balanceador
3. HAProxy distribuye el tráfico entre los servidores web
4. Los servidores web consultan la base de datos primaria
5. PostgreSQL replica los datos hacia el nodo secundario

---

## 🌐 Esquema de Red

- Red interna: `HA-LAB`
- Segmento: `192.168.100.0/24`
- Comunicación aislada entre nodos
- No existe dependencia externa

---

## 📁 Archivos Incluidos

- `screenshots/arquitectura_cluster.png`  
  Diagrama general del cluster HA con todos los componentes.

---

## 📌 Utilidad de los Diagramas

✔ Comprensión rápida del sistema  
✔ Soporte para documentación técnica  
✔ Ayuda en troubleshooting  
✔ Base para ampliaciones futuras  

---

## 🧠 Recomendación

Para proyectos de alta disponibilidad, los diagramas son tan importantes como la configuración.  
Permiten identificar rápidamente **single points of failure**, dependencias críticas y flujos de tráfico.