# 4️⃣ HAProxy – Balanceo de Carga HTTP

## 🎯 Objetivo

Implementar un **balanceador de carga** altamente disponible utilizando **HAProxy**, encargado de distribuir el tráfico HTTP entrante entre múltiples servidores web y detectar automáticamente la caída o recuperación de nodos backend.

HAProxy se despliega en **dos nodos (LB1 y LB2)** para trabajar conjuntamente con Keepalived y garantizar continuidad del servicio.

---

## 🧱 Arquitectura de Balanceo

| Nodo | Nombre | IP               | Rol |
|----|------|------------------|----|
| LB1 | lb1 | 192.168.100.10 | HAProxy + Keepalived |
| LB2 | lb2 | 192.168.100.11 | HAProxy + Keepalived |

Backends balanceados:

| Backend | IP |
|------|----|
| WEB1 | 192.168.100.20 |
| WEB2 | 192.168.100.21 |

El acceso de los clientes se realizará mediante una **IP Virtual (VIP)** gestionada por Keepalived.

---

## 🔧 Instalación de HAProxy

En **LB1 y LB2** ejecutar:

```bash
apt update
apt install haproxy -y
```

Comprobar instalación:

```bash
haproxy -v
```

---

⚙️ Configuración de HAProxy

Editar el archivo principal de configuración:

```bash
nano /etc/haproxy/haproxy.cfg
```

Configuracion en: **configs/haproxy.cfg**

---

## ▶️ Arranque y Habilitación del Servicio

En LB1 y LB2:

```bash
systemctl enable haproxy
systemctl restart haproxy
```

Verificar estado:

```bash
systemctl status haproxy
```

## ✅ Pruebas de Funcionamiento

### Prueba directa de balanceo

Desde cualquier nodo de la red:

```bash
curl 192.168.100.100
```

Refrescando varias veces, el resultado debe alternar entre:

- Servidor WEB1
- Servidor WEB2

Esto confirma:

✔ Balanceo round-robin
✔ Comunicación correcta con los backends

---

### Comprobación de Health Checks

Detener Nginx en WEB1:

```bash
systemctl stop nginx
```

Ejecutar varias peticiones:

```bash
for i in {1..6}; do curl -s 192.168.100.100; done
```

Resultado esperado:

- Solo responde Servidor WEB2

Volver a levantar WEB1:

```bash
systemctl start nginx
```

El backend se reincorpora automáticamente.

✔ Detección de fallos
✔ Exclusión automática
✔ Reincorporación sin intervención manual

---

## 📊 Monitorización (Stats)

Acceso al panel de estado:

```bash
curl 192.168.100.100:8404/stats
```

Desde aquí se puede observar:

- Estado UP/DOWN de backends
- Conexiones activas
- Estadísticas de tráfico

---

## 📌 Conclusión

HAProxy proporciona:

- Balanceo de carga eficiente
- Health checks automáticos
- Alta tolerancia a fallos
- Base sólida para arquitecturas HA

Integrado con Keepalived, permite una solución de alta disponibilidad real sin Kubernetes, ideal para entornos tradicionales y productivos.