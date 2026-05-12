#!/bin/sh
set -e

cat > /app/config.py <<EOF
PORT = ${PORT:-443}
USERS = {
    "${SECRET:-0123456789abcdef0123456789abcdef}": "user",
}
TAG = "${TAG:-}"
TLS_DOMAIN = "${TLS_DOMAIN:-www.google.com}"
EOF

exec python3 /app/main.py
