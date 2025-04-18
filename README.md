# 🔐 Active Directory (AD) Security Lab

This project is a beginner-friendly **Active Directory lab** built using **VirtualBox**. It demonstrates setting up a Windows Server 2022 domain controller, Windows 10 client, and a Kali Linux attacker machine to explore AD functionality and basic security.

## 💡 What You'll Learn

- Installing & configuring Active Directory Domain Services (AD DS)
- Creating a domain and managing users
- Setting up DHCP and routing
- Joining client machines to a domain
- Automating user creation with PowerShell
- Simulating attack scenarios using Kali Linux


## 📁 Repository Structure

```plaintext
active-directory-lab/
│
├── README.md
├── LICENSE.md
│
├── setup/
│   ├── ad-setup.md
│   ├── vm-setup.md
│   ├── ad-hardening.md
│   └── network-config.md
│
├── scripts/
│   ├── User_Name_Generator_.ps1
│   ├── User_Creator_.ps1
│   └── User_Distribution.ps1
│
├── issues/
│   └── troubleshooting-log.md
│
├── notes/
│   └── resources.md

```

---

## 🖥️ Lab Setup

| Component          | OS / Version       |
|-------------------|--------------------|
| Domain Controller | Windows Server 2022 |
| Client Machine    | Windows 10 Pro      |
| Attacker Machine  | Kali Linux (Latest) |

---

## ⚙️ Key Steps

1. **Install Virtual Machines** using VirtualBox
2. **Configure Networking**  
   - One NAT adapter for internet  
   - One Internal adapter for local communication  
3. **Enable drag & drop + copy/paste** (Install Guest Additions)
4. **Rename PCs** (optional but recommended)
5. **Setup static IP** on the DC internal network
6. **Install AD DS** and promote server to Domain Controller
7. **Create Domain + Admin User**
8. **Install Routing & Remote Access**
9. **Enable DHCP and define IP scope**
10. **Auto-create 1000 users using PowerShell**
11. **Join Windows 10 Client to Domain**
12. **Login with one of the created users**
13. **Hardening of AD**
14. **Security Testing with Kali**
---

## 🔧 Scripts

- `scripts/User_Name_Generator.ps1`  
  Generates 1000 names to a text file using PowerShell.  
  _(Sample user list included in repo)_

- `scripts/User_Creator_.ps1`  
  Creates 1000 users from a text file using PowerShell.

---

## 🐞 Issues Encountered

Check [`issues/troubleshooting-log.md`](./issues/troubleshooting-log.md) for notes on problems and how they were solved.

---

## 📺 Resources

- [YouTube Guide](https://www.youtube.com/watch?v=MHsI8hJmggI)
- [Medium Article](https://medium.com/@austindwarner8/active-directory-hardening-to-learn-basic-concepts-regarding-active-directory-attacks-and-8f0c92e12443)
- [TryHackMe Room](https://tryhackme.com/room/activedirectoryhardening)

---

## 📸 Screenshots

Visual references of key steps and results from the lab setup and testing.

---

## 📁 Future Plans

- Implement attack scenarios using Kali Linux for penetration testing
- Configure and manage Group Policy Objects (GPO) for enhanced security
- Set up monitoring and analysis with Windows Event Viewer for log management

---

## 🧠 Notes

- Optimize VM resource usage, especially on limited hardware (e.g., allocate 2 CPU cores and 2GB RAM for client VMs).
- Regularly back up your VMs after each milestone to safeguard progress and prevent data loss.


---

## 📌 Tags

`#ActiveDirectory` `#WindowsServer` `#HomeLab` `#PowerShell` `#Beginner` `#Cybersecurity`

