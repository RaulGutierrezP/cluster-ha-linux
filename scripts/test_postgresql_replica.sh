#!/bin/bash
# test_postgresql_replica.sh
# Verifica estado de la réplica PostgreSQL

echo "Verificando estado de replicación PostgreSQL"
echo "-------------------------------------------"

su - postgres -c "psql -c 'SELECT pg_is_in_recovery();'"

echo
echo "Mostrando datos replicados:"
su - postgres -c "psql -d prueba -c 'SELECT * FROM test;'"