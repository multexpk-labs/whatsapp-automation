#!/usr/bin/env bash
set -u

echo "== WhatsApp Automation Health =="
echo "Time: $(date -Is)"
echo "Host: $(hostname)"
echo "Kernel: $(uname -sr)"

echo "--- Memory ---"
free -h 2>/dev/null || true

echo "--- Disk ---"
df -h / 2>/dev/null || true

echo "--- Listening services ---"
ss -lnt 2>/dev/null || true
