#!/bin/sh

echo "Starting certbot auto-renew loop..."

while true; do
    echo "[certbot] Running certificate renew..."
    certbot renew --webroot -w /var/www/certbot

    echo "[certbot] Reloading nginx..."
    docker exec nginx nginx -s reload

    echo "[certbot] Sleeping 12 hours..."
    sleep 12h
done
