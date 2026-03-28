cat > script3.sh << 'EOF'
#!/bin/bash
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
echo "=============================================="
echo "        Directory Audit Report"
echo "        $(date '+%d %B %Y, %H:%M:%S')"
echo "=============================================="
echo ""
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  Directory : $DIR"
        echo "  Size      : $SIZE"
        echo "  Perms     : $PERMS"
        echo "  Owner     : $OWNER : $GROUP"
        echo "----------------------------------------------"
    else
        echo "  ✘ $DIR does not exist on this system"
        echo "----------------------------------------------"
    fi
done
echo ""
echo "--- LibreOffice Config Directory Check ---"
LO_CONFIG="$HOME/.config/libreoffice"
if [ -d "$LO_CONFIG" ]; then
    echo "  ✔ LibreOffice config found at: $LO_CONFIG"
    ls -ld "$LO_CONFIG"
else
    echo "  ✘ LibreOffice config not found at $LO_CONFIG"
    echo "  (LibreOffice not installed on this system)"
fi
echo "=============================================="
EOF
bash script3.sh
