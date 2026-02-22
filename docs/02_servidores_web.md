# 2️⃣ Configuración de Servidores Web (Nginx)

## 🎯 Objetivo

Implementar servidores web redundantes que serán utilizados como **backends** por el balanceador HAProxy, permitiendo la distribución de tráfico y pruebas reales de alta disponibilidad.

Se despliegan dos nodos web independientes con contenido diferenciable para comprobar el balanceo de carga y la detección automática de fallos.

---

## 🧱 Arquitectura de Servidores Web

| Nodo | Nombre | IP               | Servicio |
|----|------|------------------|---------|
| WEB1 | web1 | 192.168.100.20 | Nginx |
| WEB2 | web2 | 192.168.100.21 | Nginx |

Ambos nodos:
- Ejecutan Debian 13
- Exponen HTTP por el puerto 80
- Residen en la red interna `HA-LAB`

---

## 🔧 Instalación de Nginx

En **WEB1 y WEB2** ejecutar:

```bash
apt update
apt install nginx -y
```

Verificar instalación:

```bash
systemctl status nginx
```

---

## 📝 Configuración del Contenido Web

Para poder identificar qué servidor responde a cada petición, se personaliza el archivo index.html en cada nodo.

Ruta del archivo:
```bash
/var/www/html/index.html
```

**WEB1**

Contenido:

```html
<h1>Servidor WEB1</h1>
```

**WEB2**

Contenido:

```html
<h1>Servidor WEB2</h1>
```

---

## ▶️ Habilitar y Arrancar el Servicio

En WEB1 y WEB2:

```bash
systemctl enable nginx
systemctl start nginx
```

---

## ✅ Verificación de Funcionamiento

Desde cada nodo, comprobar acceso local:

```bash
curl localhost
```

Resultado esperado:

- WEB1 → Servidor WEB1
- WEB2 → Servidor WEB2

También se puede verificar desde otro nodo de la red:

```bash
curl 192.168.100.20
curl 192.168.100.21
```

---

## 🧪 Preparación para Alta Disponibilidad

En este punto:

✔ Los servidores web responden correctamente
✔ El contenido permite identificar el nodo activo
✔ Están listos para ser balanceados por HAProxy
✔ Soportan pruebas de caída y reincorporación automática

## 📌 Conclusión

La correcta separación de nodos web y su validación individual es un paso crítico en arquitecturas de alta disponibilidad.
Este diseño permite detectar fallos de backend, validar health checks y simular escenarios reales de producción.