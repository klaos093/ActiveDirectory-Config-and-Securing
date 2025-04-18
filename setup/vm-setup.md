# 🛠️ VM Setup Guide

This guide walks you through creating the virtual machines (VMs) needed for the Active Directory Lab using **VirtualBox**.

---

## 🧰 Requirements

- [VirtualBox](https://www.virtualbox.org/)
- Windows Server 2022 ISO
- Windows 10 Pro ISO
- Kali Linux ISO
- At least **8 GB RAM** (recommended)
- At least **50 GB disk space** (minimum)

---

## 📦 Virtual Machines Overview

| VM Name         | OS                  | Role                | Resources            |
|-----------------|---------------------|---------------------|----------------------|
| DC-Server       | Windows Server 2022 | Domain Controller   | 2 CPU, 4 GB RAM, 30 GB HDD |
| Win10-Client    | Windows 10 Pro      | Domain Client       | 2 CPU, 2 GB RAM, 25 GB HDD |
| Kali-Attacker   | Kali Linux (latest) | Attacker Machine    | 2 CPU, 2 GB RAM, 20 GB HDD |

---

## 🔧 Step-by-Step VM Creation

### 1. Create the Domain Controller VM

- Open VirtualBox → Click **New**
- Name: `DC-Server`
- Type: `Microsoft Windows`, Version: `Windows 2022 (64-bit)`
- Memory: `4 GB`
- Hard Disk: Create a virtual hard disk now → `30 GB` dynamically allocated
- Network: Add **two adapters**
  - **Adapter 1**: NAT
  - **Adapter 2**: Internal Network (Name it `intnet`)
- Mount the Windows Server ISO and start the installation

---

### 2. Create the Windows 10 Client VM

- Name: `Win10-Client`
- Type: `Microsoft Windows`, Version: `Windows 10 (64-bit)`
- Memory: `2 GB`
- Hard Disk: `25 GB` dynamically allocated
- Network: Same setup as above:
  - **Adapter 2**: Internal Network (`intnet`)
- Mount the Windows 10 ISO and install

---

### 3. Create the Kali Linux Attacker VM

- Name: `Kali-Attacker`
- Type: `Linux`, Version: `Debian (64-bit)`
- Memory: `2 GB`
- Hard Disk: `20 GB` dynamically allocated
- Network:
  - **Adapter 2**: Internal Network (`intnet`)
- Mount the Kali ISO and install as normal

---

## 🪛 Post-Installation Tips

- **Install Guest Additions** on Windows VMs to enable copy/paste and drag & drop
- **Update all VMs** after installation
- Take a **snapshot** after clean install to save a "fresh" state
- Use the same **internal network** name (e.g., `intnet`) for all VMs

---

## ✅ Next Step

Once VMs are set up, proceed to [`network-config.md`](./network-config.md) to configure networking and prepare for domain setup.
