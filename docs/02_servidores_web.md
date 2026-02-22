# 2️⃣ Configuración de Servidores Web

## 📌 Objetivo
Implementar servidores web redundantes para ser balanceados por HAProxy.

## 🔧 Instalación de Nginx (WEB1 y WEB2)

```bash
apt update
apt install nginx -y
```

## 📝 Configuración de contenido

En la ruta: **/var/www/html/index.nginx-debian.html**

### WEB1

<h1>Servidor WEB1</h1>

### WEB2

<h1>Servidor WEB2</h1>

## ▶️ Activar servicio

```bash
systemctl enable nginx
systemctl start nginx
```

## ✅ Verificación

Acceder desde el balanceador o vía curl para confirmar respuesta HTTP.

```bash
curl 192.168.100.20
curl 192.168.100.21
```