#!/bin/sh
export ADMIN_TOKEN=$(openssl rand -hex 16)
export PLAYWRIGHT_BROWSERS_PATH="/opt/playwright"
echo "ADMIN_TOKEN = $ADMIN_TOKEN"
exec apache2-foreground