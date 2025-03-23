#!/bin/bash
while true
do
  cpu=$(mpstat 1 1 | awk '/Average/ && $3 ~ /[0-9.]+/ {print 100 - $NF}')
  usage=${cpu%.*}
  echo "CPU Usage: $usage%"
  if [ "$usage" -ge 75 ]; then
    echo "CPU exceeded threshold! Scaling to GCP..."
    ./scale_up.sh
    break
  fi
  sleep 60
done
