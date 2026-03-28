cat > script5.sh << 'EOF'
#!/bin/bash
print_line() { echo "----------------------------------------------"; }
echo "=============================================="
echo "     Open Source Manifesto Generator"
echo "     Student: Nishita | 24BCE10761"
echo "=============================================="
echo ""
echo "Answer three questions to generate your manifesto."
echo ""
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD
DATE=$(date '+%d %B %Y')
USERNAME=$(whoami)
OUTPUT="manifesto_${USERNAME}.txt"
> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo "  OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  By: Nishita (24BCE10761)" >> "$OUTPUT"
echo "  Date: $DATE" >> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool built not for profit, but for people." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM, and that is exactly what open source represents:" >> "$OUTPUT"
echo "the freedom to use, study, modify, and share software without permission or payment." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a licensing model. It is a philosophy." >> "$OUTPUT"
echo "It says that knowledge should not be locked behind walls," >> "$OUTPUT"
echo "and that a student should have access to the same tools as a billion-dollar corporation." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day, I want to build $BUILD and share it freely —" >> "$OUTPUT"
echo "because every great open-source project started with one person" >> "$OUTPUT"
echo "who decided their work was worth sharing with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $USERNAME, $DATE" >> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo ""
echo "✔ Manifesto saved to: $OUTPUT"
print_line
cat "$OUTPUT"
EOF
bash script5.sh
