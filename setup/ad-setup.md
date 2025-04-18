# 🧱 Active Directory Setup

This guide walks you through installing and configuring **Active Directory Domain Services (AD DS)** on your Windows Server 2022 VM, making it your lab’s Domain Controller (DC), and sets the stage for user management, client integration, and further testing.

---

## 🔗 Prerequisites

Before proceeding, make sure you've completed:

- ✅ [VM Setup](./vm-setup.md)
- ✅ [Network Configuration](./network-config.md)
- ✅ Static IP assigned to internal adapter (e.g., `172.16.0.1`)
- ✅ Internet access via NAT (for Windows Updates and features)

---

## 📥 1. Install AD DS Role

1. Open **Server Manager**
2. Go to `Manage > Add Roles and Features`
3. Select:
   - **Role-based or feature-based installation**
   - Your local server
4. Under **Server Roles**, check:
   - ✅ `Active Directory Domain Services`
5. Proceed through the wizard and click **Install**

> ⏳ Wait for installation to complete. Do not close the wizard.

---

## 🚀 2. Promote Server to Domain Controller

1. Click: `Promote this server to a domain controller`
2. Choose:
   - `Add a new forest`
   - Domain name: `mydomain.com`
3. Set options:
   - ✅ DNS Server
   - ✅ Global Catalog
   - Set **DSRM password**
4. Proceed through the wizard and click **Install**

> 🖥️ The server will reboot automatically after promotion.

---

## 🔑 3. First Login & Verification

1. Log in with domain credentials:  
   `MYDOMAIN\Administrator`
2. Open **Server Manager**
   - Verify AD DS and DNS roles are running
3. Open **Active Directory Users and Computers**
   - Confirm domain is listed (e.g., `mydomain.com`)

---

## 🌐 4. Verify DNS Setup

1. Open **DNS Manager**
2. Check for:
   - A **Forward Lookup Zone** for `mydomain.com`
   - A **Host (A)** record pointing to `172.16.0.1`

---

## 👤 5. Create Domain Admin (Optional)

1. In AD Users and Computers:  
   `mydomain.com > Users > New > User`
2. Example:
   - Name: `john.admin`
   - Add to groups: `Domain Admins`, `Enterprise Admins`

---

## 🧪 6. Domain Function Test

- Confirm login with domain credentials
- Verify DNS and IP settings on internal adapter
- Ensure client VM can ping the DC on `172.16.0.1`

---

## 🔜 What's Next?

Continue building your AD Lab with these steps:

### 📦 1. Configure DHCP

- Enable DHCP on the DC  
- Set IP scope: `172.16.0.100 – 172.16.0.200`  
- Guide: [Network Config → DHCP Setup](./network-config.md#3-set-up-dhcp-on-the-dc)

---

### 👥 2. Create Bulk Users

- Run the PowerShell script to auto-generate 10,000 users  
- Path: [`scripts/User_Creator_.ps1`](../scripts/User_Creator_.ps1)  
- Ensure the target OU (e.g., `_EMPLOYEES`) exists

---

### 🗃️ 3. Distribute Users into OUs

- Randomly assign users to `Sales`, `Support`, and `Service` OUs  
- Script: [`scripts/User_Distribution.ps1`](../scripts/User_Distribution.ps1)  
- Creates a more realistic environment for testing and auditing

---

### 💻 4. Join Windows 10 Client to Domain

- Change the network adapter to **Internal Network** (`LabNetwork`)
- Ensure IP is obtained via **DHCP** or set a static IP (e.g., `172.16.0.101`)
- Set **Preferred DNS Server** to the Domain Controller IP (e.g., `172.16.0.1`)

#### 🖥️ Join Domain

1. Right-click on **This PC** → **Properties**
2. Click **Advanced system settings**
3. Under **Computer Name**, click **Change...**
4. Select **Domain**, then enter:

### 🧪 5. Begin Security Testing (Optional)

Once all systems are connected:

- Test basic AD enumeration using Kali Linux tools (e.g., `enum4linux`, `rpcclient`)
- Start hardening your environment

---

## 📝 Tip

Regularly **snapshot your VM** after each step to avoid losing progress. This will also help you experiment with attacks and revert safely.

---

🔙 Return to [Home README](../README.md)
