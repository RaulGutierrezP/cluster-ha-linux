# Problemas Frecuentes y Solución de Incidencias

## 🎯 Objetivo

Este documento recopila los **problemas más comunes** encontrados durante la implementación del cluster de alta disponibilidad, junto con sus **causas y soluciones**, facilitando el troubleshooting y reduciendo tiempos de resolución.

---

## ⚠️ HAProxy no arranca

### ❌ Síntomas

```bash
systemctl status haproxy
```

Estado: failed

### 🔍 Causas comunes

- Error de sintaxis en haproxy.cfg
- Backend mal definido
- IP o puerto incorrecto

### ✅ Solución

```bash
haproxy -c -f /etc/haproxy/haproxy.cfg
```

Corregir los errores indicados y reiniciar el servicio.

---

## ⚠️ No hay balanceo entre WEB1 y WEB2

### ❌ Síntomas

Siempre responde el mismo servidor

### 🔍 Causas comunes

- Nginx detenido en uno de los nodos
- Health checks fallando
- IP incorrecta en HAProxy

### ✅ Solución

```bash
systemctl status nginx # En los dos nodos

curl http://192.168.100.20
curl http://192.168.100.21
```

---

## ⚠️ La IP Virtual no aparece

### ❌ Síntomas

```bash
ip a | grep 192.168.100.100
```

No devuelve resultados

### 🔍 Causas comunes

- Keepalived no está en ejecución
- Interfaz de red incorrecta
- virtual_router_id distinto entre nodos

### ✅ Solución

```bash
systemctl restart keepalived
journalctl -u keepalived
```

---

## ⚠️ La VIP aparece en ambos nodos

### ❌ Síntomas

La IP virtual está activa en LB1 y LB2

### 🔍 Causas comunes

- Autenticación VRRP incorrecta
- Red mal configurada
- Firewall bloqueando VRRP

### ✅ Solución

- Verificar auth_pass
- Revisar conectividad L2
- Asegurar misma red interna

---

## ⚠️ PostgreSQL no replica

### ❌ Síntomas

```sql
SELECT pg_is_in_recovery();
```

Devuelve f

### 🔍 Causas comunes

- Error en pg_hba.conf
- Usuario replicador incorrecto
- Backup inicial incompleto

### ✅ Solución

- Revisar permisos
- Repetir pg_basebackup
- Revisar logs: **journalctl -u postgresql**

---

## 📌 Conclusión

La mayoría de incidencias en entornos HA se deben a:

- Errores de configuración
- Fallos de red
- Servicios detenidos

Una buena documentación y pruebas controladas permiten detectar y resolver problemas rápidamente, garantizando la estabilidad del sistema.