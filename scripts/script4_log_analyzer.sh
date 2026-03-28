cat > script4.sh << 'EOF'
#!/bin/bash
LOGFILE=${1:-"/var/log/syslog"}
KEYWORD=${2:-"error"}
COUNT=0
RETRIES=3
ATTEMPT=0
while [ $ATTEMPT -lt $RETRIES ]; do
    if [ -f "$LOGFILE" ]; then
        break
    else
        ATTEMPT=$((ATTEMPT + 1))
        echo "Attempt $ATTEMPT: File '$LOGFILE' not found. Retrying..."
        sleep 1
    fi
done
if [ ! -f "$LOGFILE" ]; then
    echo "Error: '$LOGFILE' not found after $RETRIES attempts."
    exit 1
fi
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File is empty. Nothing to analyze."
    exit 0
fi
echo "=============================================="
echo "  Log File Analyzer"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD'"
echo "=============================================="
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"
echo "  Keyword '$KEYWORD' found $COUNT time(s)"
echo ""
echo "--- Last 5 matching lines ---"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "=============================================="
EOF
bash script4.sh /var/log/syslog error
