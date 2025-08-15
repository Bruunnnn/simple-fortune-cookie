APP_URL="http://localhost:8080"

echo "Testing connection to $APP_URL"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL" || true)
echo $STATUS_CODE
if [ "$STATUS_CODE" = "200" ]; then
   echo "Application reached (HTTP $STATUS_CODE)"
   exit 0
else
    echo "Unreachable (HTTP $STATUS_CODE)"
    exit 1
fi