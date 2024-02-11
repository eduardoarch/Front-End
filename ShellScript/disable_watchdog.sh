#!/bin/bash
#
#
# disable_watchdog.sh - To disable watchdog timers (both software and hardware)
#
# Site       : https://forum.endeavouros.com/t/slightly-slower-boot-and-shutdown/4466/5 
#            : https://wiki.archlinux.org/title/Improving_performance_(Portugu%C3%AAs)
# Autor      : Eduardo Rosa <NeonComputerArt@outlook.com>
# Manutenção : Santos <NeonComputerArt@outlook.com>
#
#
# ------------------------------------------------------------
#
# Check if /etc/sysctl.d/disable_watchdog.conf exists
if [ -f "/etc/sysctl.d/disable_watchdog.conf" ]; then
    # Append the variable to the existing file
    echo "kernel.nmi_watchdog = 0" | sudo tee -a /etc/sysctl.d/disable_watchdog.conf > /dev/null
else
    # Create a new file and add the variable
    echo "kernel.nmi_watchdog = 0" | sudo tee /etc/sysctl.d/disable_watchdog.conf > /dev/null
fi

# Check if /etc/modprobe.d/watchdog.conf exists
if [ -f "/etc/modprobe.d/watchdog.conf" ]; then
    # Append the blacklist variables to the existing file
    echo "iTCO_wdt blacklist" | sudo tee -a /etc/modprobe.d/watchdog.conf > /dev/null
    echo "iTCO_vendor_support blacklist" | sudo tee -a /etc/modprobe.d/watchdog.conf > /dev/null
else
    # Create a new file and add the blacklist variables
    echo "iTCO_wdt blacklist" | sudo tee /etc/modprobe.d/watchdog.conf > /dev/null
    echo "iTCO_vendor_support blacklist" | sudo tee -a /etc/modprobe.d/watchdog.conf > /dev/null
fi
#
# Save the above script to a file, e.g., add_text.sh, and make it executable using the following command:
# chmod +x disable_watchdog.sh
#
#
# Histórico:
# 
# v1.0 2023-06-25, Eduardo rosa:
#   - Versão inicial 
# 
# Licença:GPL
# 
#