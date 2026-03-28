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
cat > test.log << 'EOF'
2026-03-28 10:02:11 ERROR failed to load module libssl
2026-03-28 10:04:22 ERROR connection timeout on port 443
2026-03-28 10:06:33 ERROR permission denied /var/lib/apt
2026-03-28 10:09:12 ERROR segmentation fault in process 4821
2026-03-28 10:12:05 ERROR failed to write to /var/log/audit.log
EOF
bash script4.sh test.log error
