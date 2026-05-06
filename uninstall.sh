#!/usr/bin/env bash
set -Eeuo pipefail

APP_ID="pi4-os-hardware-monitor"
GTK_APP_ID="io.github.ke2hni.pi4_os_hardware_monitor"
INSTALL_DIR="/opt/${APP_ID}"
BIN_PATH="/usr/local/bin/${APP_ID}"
DESKTOP_PATH="/usr/share/applications/${GTK_APP_ID}.desktop"
LEGACY_DESKTOP_PATH="/usr/share/applications/${APP_ID}.desktop"
ICON_PATH="/usr/share/pixmaps/${APP_ID}.png"
ICON_THEME_DIR="/usr/share/icons/hicolor"
SUDOERS_PATH="/etc/sudoers.d/${APP_ID}"

if [[ "${EUID}" -ne 0 ]]; then
    echo "Run with sudo: sudo ./uninstall.sh" >&2
    exit 1
fi

rm -f "${BIN_PATH}" "${DESKTOP_PATH}" "${LEGACY_DESKTOP_PATH}" "${ICON_PATH}" "${SUDOERS_PATH}"
rm -rf "${INSTALL_DIR}"

for size in 32 48 64 128 256; do
    rm -f "${ICON_THEME_DIR}/${size}x${size}/apps/${APP_ID}.png"
done

gtk-update-icon-cache "${ICON_THEME_DIR}" >/dev/null 2>&1 || true
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi

echo "Pi 4 OS Hardware Monitor removed. The pi-hardware-monitor group is left in place intentionally."
