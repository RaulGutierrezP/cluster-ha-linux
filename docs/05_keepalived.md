# 5️⃣ Keepalived – Failover del Balanceador (VRRP)

## 🎯 Objetivo

Garantizar la **alta disponibilidad del balanceador de carga** mediante **Keepalived**, utilizando el protocolo **VRRP** para gestionar una **IP virtual (VIP)** que se mueve automáticamente entre nodos en caso de fallo.

Esta solución permite **cero intervención manual** y **mínimo downtime** ante la caída del balanceador principal.

---

## 🧱 Arquitectura de Failover

| Nodo | Nombre | IP               | Rol |
|----|------|------------------|----|
| LB1 | lb1 | 192.168.100.10 | MASTER |
| LB2 | lb2 | 192.168.100.11 | BACKUP |
| VIP | —   | 192.168.100.100 | IP Virtual |

- Solo **un nodo** posee la VIP activa en cada momento.
- El nodo BACKUP monitoriza constantemente al MASTER.
- Ante fallo, la VIP migra automáticamente.

---

## 🔧 Instalación de Keepalived

En **LB1 y LB2** ejecutar:

```bash
apt update
apt install keepalived -y
```

Comprobar instalación:

```bash
keepalived --version
```

---

## ⚙️ Configuración de Keepalived

📍 Interfaz de Red

Antes de configurar, identificar la interfaz conectada a la red HA-LAB:

```bash
ip a
```

En este laboratorio se utiliza:

```bash
enp0s3
```

🔹 Configuración LB1 (MASTER)

Editar el archivo:

```bash
nano /etc/keepalived/keepalived.conf
```

Contenido completo en: **configs/keepalived_master.conf**

🔹 Configuración LB2 (BACKUP)

Editar el archivo:

```bash
nano /etc/keepalived/keepalived.conf
```

Contenido completo en: **configs/keepalived_backup.conf**

---

## ▶️ Arranque y Habilitación

En LB1 y LB2:

```bash
systemctl enable keepalived
systemctl restart keepalived
```

Verificar estado:

```bash
systemctl status keepalived
```

---

## ✅ Verificación de IP Virtual (VIP)

En LB1 (MASTER)

```bash
ip a | grep 192.168.100.100
``` 
Resultado esperado:

- La VIP debe aparecer en LB1.

En LB2 (BACKUP)

```bash
ip a | grep 192.168.100.100
``` 
Resultado esperado:

- No debe aparecer la VIP.

---

## 🔁 Prueba de Failover Real

Simular caída del MASTER

En LB1:

```bash
poweroff
```

Comprobar migración de la VIP

En LB2:

```bash
ip a | grep 192.168.100.100
```

Resultado esperado:

- La VIP aparece ahora en LB2.

Verificar continuidad del servicio

Desde cualquier nodo:

```bash
curl 192.168.100.100
```

✔ El servicio sigue respondiendo
✔ No hay intervención manual
✔ Failover automático funcional

## 📌 Conclusión

Keepalived permite:

✔ Alta disponibilidad real
✔ Failover inmediato del balanceador
✔ Uso de VRRP estándar
✔ Integración perfecta con HAProxy

Este componente es clave para garantizar continuidad total del servicio en entornos productivos tradicionales.