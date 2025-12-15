#!/usr/bin/env bash
set -euo pipefail
mkdir -p archived
ts=$(date +%Y%m%d_%H%M%S)
cp app.log "archived/app.log.$ts"
echo "archived/app.log.$ts"
