# 1️⃣ Infraestructura del Laboratorio HA

## 🎯 Objetivo
Diseñar un laboratorio de alta disponibilidad en Linux simulando un entorno productivo real, utilizando máquinas virtuales y red aislada.

## 🧱 Máquinas Virtuales

| VM  | Nombre | IP               | RAM | Rol |
|---- |------- |----------------- |---- |---- |
| 1   | LB1    | 192.168.100.10   | 1GB | HAProxy + Keepalived |
| 2   | LB2    | 192.168.100.11   | 1GB | HAProxy + Keepalived |
| 3   | WEB1   | 192.168.100.20   | 1GB | Nginx |
| 4   | WEB2   | 192.168.100.21   | 1GB | Nginx |
| 5   | DB1    | 192.168.100.30   | 1GB | PostgreSQL Primary |
| 6   | DB2    | 192.168.100.31   | 1GB | PostgreSQL Replica |

## 🌐 Red
- Tipo: Red interna
- Nombre: `HA-LAB`
- Comunicación aislada entre nodos

## 🖥️ Sistema Operativo
- Debian 13 en todos los nodos
- Instalación mínima sin entorno gráfico