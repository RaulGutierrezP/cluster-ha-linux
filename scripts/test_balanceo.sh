#!/bin/bash
# test_balanceo.sh
# Prueba de balanceo HAProxy vía VIP

VIP="192.168.100.100"

echo "Probando balanceo HAProxy contra $VIP"
echo "------------------------------------"

for i in {1..6}; do
  echo -n "Petición $i: "
  curl -s $VIP
  sleep 1
done

echo "------------------------------------"
echo "Prueba de balanceo finalizada"