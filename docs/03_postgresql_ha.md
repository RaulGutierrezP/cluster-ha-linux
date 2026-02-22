# 3️⃣ PostgreSQL en Alta Disponibilidad

## 🎯 Objetivo

Implementar una base de datos en **alta disponibilidad** mediante **replicación primaria-secundaria (Streaming Replication)** con PostgreSQL, garantizando continuidad del servicio y protección de datos ante fallos del nodo principal.

---

## 🧱 Arquitectura de Base de Datos

| Nodo | Nombre | IP               | Rol |
|----|-------|------------------|----|
| DB1 | Primary | 192.168.100.30 | Escritura |
| DB2 | Replica | 192.168.100.31 | Solo lectura |

- **DB1** actúa como nodo primario.
- **DB2** mantiene una réplica sincronizada en tiempo real.
- La réplica no permite escrituras (protección de datos).

---

## 🔧 Instalación de PostgreSQL

En **DB1 y DB2**:

```bash
apt update
apt install postgresql -y
```

Verificar versión instalada:

```bash
psql --version
```

---

## ⚙️ Configuración del Nodo Primario (DB1)

1️⃣ postgresql.conf

Editar:

```bash
nano /etc/postgresql/17/main/postgresql.conf
```
Modificar los siguientes parámetros:

```bash
listen_addresses = '*'
wal_level = replica
max_wal_senders = 5
```

Explicación:

wal_level = replica: habilita logs para replicación
max_wal_senders: número máximo de réplicas 

2️⃣ pg_hba.conf

Editar:

```bash
nano /etc/postgresql/17/main/pg_hba.conf
```

Añadir al final:
```bash
host replication replicador 192.168.100.31/32 md5
```

Esto permite que DB2 se conecte para replicar datos.

3️⃣ Crear usuario de replicación

```bash
su - postgres -c psql
```

Dentro de PostgreSQL:

```sql
CREATE ROLE replicador WITH REPLICATION LOGIN PASSWORD 'password';
```

Reiniciar PostgreSQL:

```bash
systemctl restart postgresql
```

---

## ⚙️ Configuración del Nodo Réplica (DB2)

1️⃣ Detener PostgreSQL

```bash
systemctl stop postgresql
```

2️⃣ Eliminar datos existentes

```bash
rm -rf /var/lib/postgresql/17/main/*
```

⚠️ Paso crítico: este directorio debe quedar vacío antes de clonar.

3️⃣ Clonar datos desde el Primario

```sql
su - postgres -c "pg_basebackup -h 192.168.100.30 -D /var/lib/postgresql/17/main -U replicador -P -R"
```

Qué hace este comando:

- Copia los datos del primario
- Configura automáticamente la réplica (-R)
- Deja PostgreSQL listo para arrancar como standby

4️⃣ Arrancar PostgreSQL

```sql
systemctl start postgresql
```

---

## ✅ Verificación de la Replicación

Comprobar modo réplica (DB2)

```sql
su - postgres -c "psql -c 'SELECT pg_is_in_recovery();'"
```

Resultado esperado:
-> t

---

## 🧪 Pruebas Funcionales

Crear datos en el primario (DB1)

```sql
su - postgres -c psql

CREATE DATABASE prueba;

\c prueba

CREATE TABLE test (
  id serial PRIMARY KEY,
  nombre text
);

INSERT INTO test (nombre) VALUES ('Raul');
\q
```

---

## Ver datos en la réplica (DB2)

```sql
su - postgres -c psql

\c prueba

SELECT * FROM test;
```
Resultado esperado:

 id | nombre
----+--------
 1  | Raul

---

## Intentar escritura en la réplica (DB2)

```sql
INSERT INTO test (nombre) VALUES ('Error');
```

Resultado esperado:

ERROR: cannot execute INSERT in a read-only transaction

✔ Esto confirma que la réplica está protegida.

---

## 🔥 Prueba de Caída del Primario

En DB1:

```bash
systemctl stop postgresql
```

En DB2:

```bash
su - postgres -c "psql -d prueba -c 'SELECT * FROM test;'"
```

✔ Las consultas siguen funcionando
✔ Los datos siguen disponibles
✔ La réplica mantiene el servicio en modo lectura

---

## 📌 Conclusión

Esta configuración proporciona:

- Replicación en tiempo real
- Protección ante fallos
- Integridad de datos
- Arquitectura preparada para HA avanzada (Patroni, etc.)


