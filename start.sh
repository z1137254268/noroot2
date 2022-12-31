#!/bin/bash

./xray -config xray.json &
./caddy run --config etc/caddy/Caddyfile --adapter caddyfile
