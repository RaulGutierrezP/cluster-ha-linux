#!/bin/bash
# test_failover_web.sh
# Verifica exclusión automática de un backend web

VIP="192.168.100.100"
ITER=6

echo "Probando failover de servidores web"
echo "-----------------------------------"

for i in $(seq 1 $ITER); do
  echo -n "Petición $i: "
  curl -s $VIP
  sleep 1
done

echo
echo "Si solo responde un servidor, HAProxy funciona correctamente"