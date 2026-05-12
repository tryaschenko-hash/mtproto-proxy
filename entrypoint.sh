#!/bin/sh
set -e

SECRET="${SECRET:-0123456789abcdef0123456789abcdef}"
TLS_DOMAIN="${TLS_DOMAIN:-www.google.com}"
TAG="${TAG:-}"

cat > /app/config.py <<EOF
PORT = 443

USERS = {
    "tg": "$SECRET",
}

MODES = {
    "classic": False,
    "secure": False,
    "tls": True,
}

TLS_DOMAIN = "$TLS_DOMAIN"
EOF

if [ -n "$TAG" ]; then
    echo "AD_TAG = \"$TAG\"" >> /app/config.py
fi

exec python3 /app/mtprotoproxy.py
