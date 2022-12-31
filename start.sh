#!/bin/bash
AUUID=10974d1a-cbd6-4b6f-db1d-38d78b3fb109
PORT=${PORT:-8080}

cat etc/Caddyfile | sed -e "1c :$PORT" -e "s/\$AUUID/$AUUID/g" -e "s/\$MYUUID-HASH/$(./caddy hash-password --plaintext $AUUID)/g" > etc/caddy/Caddyfile
cat etc/config.json | sed -e "s/\$AUUID/$AUUID/g" -e "s/\$ParameterSSENCYPT/$ParameterSSENCYPT/g" > xray.json


./xray -config xray.json &
./caddy run --config etc/caddy/Caddyfile --adapter caddyfile
