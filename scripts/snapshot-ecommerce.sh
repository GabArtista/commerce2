#!/usr/bin/env bash
# snapshot-ecommerce.sh
#
# Tira snapshot completo do namespace ecommerce atual (stack Medusa)
# para possibilitar rollback manual.
# Execute ANTES do cutover.
#
# Uso: bash snapshot-ecommerce.sh
# Output: /root/snapshots/ecommerce-snapshot-YYYYMMDD-HHMMSS.yaml

set -euo pipefail

SNAPSHOT_DIR="/root/snapshots"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT="$SNAPSHOT_DIR/ecommerce-snapshot-$TIMESTAMP.yaml"

mkdir -p "$SNAPSHOT_DIR"

echo "Coletando snapshot do namespace ecommerce..."

k3s kubectl get all,ingress,certificate,pvc,secret,configmap \
  -n ecommerce \
  -o yaml > "$OUTPUT"

echo "Snapshot salvo em: $OUTPUT"
echo "Para rollback: k3s kubectl apply -f $OUTPUT"
