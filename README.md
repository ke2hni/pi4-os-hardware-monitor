# 🍓 Pi 4 OS Hardware Monitor

![Platform](https://img.shields.io/badge/Platform-Raspberry%20Pi%204-blue)
![OS](https://img.shields.io/badge/OS-Raspberry%20Pi%20OS-green)
![UI](https://img.shields.io/badge/UI-GTK3-purple)
![Language](https://img.shields.io/badge/Python-3.x-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

A native Raspberry Pi OS desktop hardware monitor built for Raspberry Pi 4.

⚡ Lightweight • 🧼 Clean UI • 🖥️ Native GTK • 🔍 Live sensor data

---

## 📸 Overview

- 🌡️ CPU and power-chip temperatures
- ⚡ Power and throttling status
- 💾 microSD / USB / SATA storage detection
- 🚀 NVMe tab when NVMe storage is detected
- 🖥️ System, memory, clock, uptime, and network details
- 🪶 No background services, no history collector, no logging daemon

---

## 🚀 Install

```bash
sudo apt update
sudo apt install -y git
git clone https://github.com/ke2hni/pi4-os-hardware-monitor.git
cd pi4-os-hardware-monitor
sudo ./install.sh
```

Launch from the Raspberry Pi OS menu, or run:

```bash
pi4-os-hardware-monitor
```

---

## 🔄 Upgrade

```bash
cd ~/pi4-os-hardware-monitor
git reset --hard
git pull
sudo ./install.sh
```

---

## 🗑️ Uninstall

```bash
cd ~/pi4-os-hardware-monitor
sudo ./uninstall.sh
```

---

## 🧠 Features

### 🌡️ Thermal / Cooling

- CPU temperature from `cpu_thermal`
- Power chip / PMIC temperature from `vcgencmd measure_temp pmic`
- Fan RPM / PWM shown only when the Pi 4 exposes usable fan telemetry

### ⚡ Power / Throttling

- Full `vcgencmd get_throttled` decoding
- Current and since-boot undervoltage state
- Current and since-boot throttling state
- Frequency cap and soft temperature limit status
- Raw status shown with human-readable explanation

### 💾 Storage

- Boot-device detection
- USB / SATA root drive support
- microSD presence and card identity when available
- External USB storage details
- NVMe support when detected through USB/NVMe adapters

### 🖥️ System

- Pi model
- Raspberry Pi OS version
- Kernel and architecture
- CPU frequency
- Memory, swap, load, uptime, hostname, and network identity
- Compact Pi 4 firmware version display

---

## 🌡️ Temperature Colors

| Color | Meaning |
|------|---------|
| 🔵 Blue | Cool |
| 🟢 Green | Normal |
| 🟡 Amber | Warm |
| 🔴 Red | Hot |

Sensor-aware thresholds are defined in `app.py`:

```python
TEMP_COLORS = {...}
TEMP_THRESHOLDS = {...}
```

---

## 🔐 Permissions

The installer creates a limited sudoers rule for storage health commands:

```bash
/etc/sudoers.d/pi4-os-hardware-monitor
```

This is used only for read-only hardware checks such as:

- `nvme`
- `smartctl`

---

## 📦 Installed Locations

```text
/opt/pi4-os-hardware-monitor/app.py
/usr/local/bin/pi4-os-hardware-monitor
/usr/share/applications/io.github.ke2hni.pi4_os_hardware_monitor.desktop
/usr/share/icons/hicolor/*/apps/pi4-os-hardware-monitor.png
/etc/sudoers.d/pi4-os-hardware-monitor
```

---

## 🧩 Design Rules

- Raspberry Pi 4 only
- Native Raspberry Pi OS desktop app
- GTK3 + Python
- Wayland-first launcher behavior
- `.desktop` filename matches GTK application ID
- Icons installed into the hicolor theme
- No background services
- No history/logging daemon
- Only the active tab refreshes
- Safe to re-run installer

---

## 🧪 Development

Run locally:

```bash
python3 app.py
```

Check syntax:

```bash
python3 -m py_compile app.py
```

---

## 📜 License

MIT License

---

## ⭐ Support

If this project helped you, star the GitHub repo.
