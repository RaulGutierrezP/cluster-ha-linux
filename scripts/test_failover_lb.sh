#!/bin/bash
# test_failover_lb.sh
# Prueba de continuidad del servicio durante failover VRRP

VIP="192.168.100.100"

echo "Comprobando disponibilidad del servicio vía VIP"
echo "------------------------------------------------"

while true; do
  date +"%H:%M:%S - $(curl -s $VIP)"
  sleep 2
done