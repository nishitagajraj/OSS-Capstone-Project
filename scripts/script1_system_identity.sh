cat > script1.sh << 'EOF'
#!/bin/bash
STUDENT_NAME="Nishita"
ROLL_NO="24BCE10761"
SOFTWARE_CHOICE="LibreOffice"
KERNEL=$(uname -r)
DISTRO=$(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATETIME=$(date '+%d %B %Y, %H:%M:%S')
echo "=============================================="
echo "       Open Source Audit — $STUDENT_NAME"
echo "       Roll No : $ROLL_NO"
echo "=============================================="
echo ""
echo "  Software Chosen : $SOFTWARE_CHOICE"
echo "  Distribution    : $DISTRO"
echo "  Kernel Version  : $KERNEL"
echo "  Logged-in User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Date & Time     : $DATETIME"
echo ""
echo "  OS License      : GNU General Public License v2 (GPL v2)"
echo "  This OS is free software — you can study, modify, and share it."
echo ""
echo "=============================================="
echo "     Audit system ready. Let's begin."
echo "=============================================="
EOF
bash script1.sh
