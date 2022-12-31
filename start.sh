#!/bin/bash
AUUID=10974d1a-cbd6-4b6f-db1d-38d78b3fb109
PORT=${PORT:-8080}


./xray -config xray.json &
./caddy run --config etc/caddy/Caddyfile --adapter caddyfile
