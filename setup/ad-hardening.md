## 🛡️ Active Directory Hardening

After setting up your Active Directory environment, it’s important to apply some basic hardening to reduce vulnerabilities and simulate a more realistic corporate environment.

### 🔐 1. Secure Domain Admin Access

- **Limit Logon Access**: Prevent Domain Admin accounts from logging into workstations.
  - Use Group Policy:  
    `Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > User Rights Assignment > Deny log on locally`  
    Add: `Domain Admins`
- **Create Separate Admin Accounts**: Avoid using Domain Admin accounts for daily tasks.

---

### 📋 2. Configure Password Policies

Set stronger password policies through Group Policy Management Console (GPMC):

- Enforce password history: `24`
- Minimum password length: `12 characters`
- Maximum password age: `60 days`
- Lockout threshold: `5 attempts`

Path:  
`Default Domain Policy > Computer Configuration > Windows Settings > Security Settings > Account Policies`

---

### 🧩 3. Remove Unused Services and Features

On the Domain Controller:

- Go to `Server Manager > Remove Roles and Features`
- Remove anything unnecessary, especially:
  - Print Services
  - Media Services
  - Remote Desktop if not required

---

### 🧰 4. Disable SMBv1

SMBv1 is outdated and vulnerable. Disable it using PowerShell:

```powershell
Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -NoRestart
```


### 🛑 5. Enable Windows Firewall & Defender

Ensure Windows Defender and the built-in firewall are active:

- Open `Windows Security > Virus & threat protection`
- Ensure real-time protection is ON
- Go to `Control Panel > Windows Defender Firewall` and make sure all profiles (Domain, Private, Public) are enabled
- Use Group Policy to enforce firewall settings across all domain-joined machines

---

### 📡 6. Monitor & Audit Logs

- Enable advanced auditing policies in Group Policy:
  - Account logon events
  - Logon failures
  - Object access (e.g., file shares, registry keys)
- Path:  
  `GPMC > Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration`
- Review events in:  
  `Event Viewer > Windows Logs > Security`

---

### 📌 7. Least Privilege Principle

- Only grant users the permissions they actually need
- Avoid adding users to high-privilege groups (e.g., Domain Admins) unless absolutely necessary
- For tasks requiring elevation, use **Run as administrator** instead of full-time admin rights

---

### 👁️ 8. Enable User Access Control (UAC)

Keep UAC enabled to prevent silent privilege escalations:

- Go to: `Control Panel > User Accounts > Change User Account Control settings`
- Set to **Always notify** for strictest security
- You can also enforce UAC via Group Policy:
  - `Computer Configuration > Windows Settings > Security Settings > Local Policies > Security Options`
  - Set policies like:  
    - "Admin Approval Mode for the Built-in Administrator account" → **Enabled**
    - "Run all administrators in Admin Approval Mode" → **Enabled**

---

> 💡 **Pro Tip**: Use offensive tools like **BloodHound** or **PingCastle** to test your AD hardening and find privilege escalation paths from the attacker’s perspective.
