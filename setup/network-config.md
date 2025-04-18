# 🌐 Network Configuration for Active Directory Lab

This guide explains how to configure networking in VirtualBox to ensure communication between all lab machines: the Domain Controller (DC), Windows 10 Client, and Kali Linux Attacker.

---

## 🗺️ Network Architecture

Each VM uses **two network adapters**:

- **NAT** – Provides internet access (used only by the DC)
- **Internal Network** – Enables communication between VMs (used by all)

<pre>

                  🌐 Internet
                       │
                 ┌─────▼──────┐
                 │  NAT (DC)  │
                 └─────┬──────┘
                       │
                ┌──────▼───────┐
                │  DC-Server   │
                └──────┬───────┘
                       │ Internal (LabNetwork)
        ┌──────────────┼──────────────┐
        │              │              │
 ┌──────▼──────┐ ┌─────▼──────┐ ┌─────▼──────┐
 │ Win10-Client│ │ Kali Linux │ │  Other VM  │
 └─────────────┘ └────────────┘ └────────────┘

</pre>



---

## 🧩 Network Summary

| VM              | Adapter(s)       | IP Address       | Gateway      | DNS Server   |
|-----------------|------------------|------------------|--------------|--------------|
| DC-Server       | NAT + Internal   | `172.16.0.1`     | —            | `127.0.0.1`  |
| Win10-Client    | Internal only    | DHCP (Assigned)  | `172.16.0.1` | `172.16.0.1` |
| Kali-Attacker   | Internal only    | DHCP (Assigned)  | `172.16.0.1` | `172.16.0.1` |

> 🔹 *Only the DC needs internet (via NAT). The rest use internal communication only.*

---

## 🛠️ Step-by-Step Configuration

### 1. Create Internal Network

1. Open **VirtualBox**
2. Go to `File > Host Network Manager`
3. Click **Create**
4. Rename it to: `LabNetwork` (or use default `intnet`)
5. Disable DHCP for the host-only network

---

### 2. Configure Domain Controller (DC)

- **Adapter 1**: Attach to **NAT**
- **Adapter 2**: Attach to **Internal Network** (`LabNetwork`)

#### Set Static IP on Internal Adapter:

1. Open `Network and Sharing Center`
2. Go to `Change adapter settings`
3. Right-click the internal adapter → `Properties`
4. Select `IPv4` → Click **Properties**
5. Enter:
   - IP: `172.16.0.1`
   - Subnet Mask: `255.255.255.0`
   - Gateway: *(leave blank)*
   - DNS Server: `127.0.0.1`

---

### 3. Set Up DHCP on the DC

1. Open **DHCP Manager**
2. Create a new scope:
   - IP Range: `172.16.0.100 – 172.16.0.200`
   - Subnet Mask: `255.255.255.0`
   - Gateway: `172.16.0.1`
   - DNS Server: `172.16.0.1`
3. Activate the scope

---

### 4. Configure Windows 10 Client

- **Adapter**: Internal Network (`LabNetwork`)
- In `Network Settings`:
   - Set IP configuration to **automatic (DHCP)**

> 🧪 The client should receive an IP like `172.16.0.101` after booting.

---

### 5. Configure Kali Linux

- **Adapter**: Internal Network (`LabNetwork`)
- Open **Network Manager** in Kali:
   - Set method to **Automatic (DHCP)**

---

## ✅ Test Connectivity

After setup:

1. Boot all VMs
2. Open Terminal or Command Prompt
3. Test connections:
   ```bash
   ping 172.16.0.1   # From client and Kali to DC
   ping [client IP]  # From DC to client
   ping [kali IP]    # From DC or client to Kali
