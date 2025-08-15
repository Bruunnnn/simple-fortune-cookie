#!/usr/bin/env bash
set -euo pipefail

# CONFIGURATION
NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')
echo $NAMESPACE

APP_URL="http://frontend.$NAMESPACE.svc.cluster.local:8080" # Default if not provided
MAX_RETRIES=10
SLEEP_SECONDS=3

echo "Testing connection to $APP_URL"

for attempt in $(seq 1 $MAX_RETRIES); do
    echo "Attempt $attempt"
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL" || true)

    if [[ "$STATUS_CODE" =~ ^2[0-9]{2}$ ]]; then
        echo "Application reached(HTTP $STATUS_CODE)"
        exit 0
    else
        echo "Unreachable (HTTP $STATUS_CODE)"
        sleep $SLEEP_SECONDS
    fi
done

echo "Application not reached"
exit 1
