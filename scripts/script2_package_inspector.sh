cat > script2.sh << 'EOF'
#!/bin/bash
PACKAGE="libreoffice"
if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "✔ $PACKAGE is installed."
    dpkg -l "$PACKAGE" | grep "^ii" | awk '{print "  Package : "$2"\n  Version : "$3}'
else
    echo "✘ $PACKAGE is NOT installed on this system."
    echo "  Install with: sudo apt install libreoffice"
fi
echo ""
echo "--- Open Source Philosophy Note ---"
case $PACKAGE in
    libreoffice)
        echo "LibreOffice: Born from a community fork of OpenOffice.org in 2010,"
        echo "proving that when a community unites, it can reclaim its own tools."
        ;;
    *) echo "$PACKAGE: Built openly, shared freely, improved collectively." ;;
esac
echo ""
echo "--- Audit complete for: $PACKAGE ---"
EOF
bash script2.sh
