# 🐞 Troubleshooting Log

This document lists issues encountered while setting up the Active Directory Lab. Some were small oversights, others were trickier. Documenting them here for future reference and learning.

---

### ❌ Issue: Unable to Login – “The sign-in method you are trying to use isn’t allowed”

**Scenario:**  
After adding a user to the `Domain Admins` group, I tried to switch users on the client machine, but received this error message:

> _“The sign-in method you are trying to use isn’t allowed.”_

**Resolution:**  
This was due to a Group Policy setting preventing login.  
✔️ **Fix:** I edited the Group Policy on the Domain Controller to allow logon for Domain Admins:
- Run `gpedit.msc` on the DC
- Go to: `Computer Configuration > Windows Settings > Security Settings > Local Policies > User Rights Assignment`
- Edit **"Allow log on locally"** and add `Domain Admins`

---

### ❌ Issue: Cannot Manage Server with New Admin User

**Scenario:**  
After creating a new user and attempting to grant admin rights, I was unable to manage the DC with that account.

**Resolution:**  
This was due to not properly specifying the group when assigning permissions.  
✔️ **Fix:** I had to **explicitly type** `Domain Admins` when adding the user to that group in Active Directory Users and Computers (ADUC). Just selecting the group list wasn't enough.

---

### ❌ Issue: No Internet Access for Admin User

**Scenario:**  
The Domain Controller had no internet access when logged in as the Admin. Windows Troubleshooter reported:

> _“Internal network does not have an IP configuration.”_

**Resolution:**  
✔️ **Fix:** I had accidentally misconfigured the **network adapters** on the DC. The NAT adapter must be assigned correctly for internet access:
- Adapter 1: NAT (Internet)
- Adapter 2: Internal (Lab Network)
- Ensure the **NAT adapter** is above the internal one in network priority

---

## ✅ Tips & Lessons Learned

- Always double-check **Group Policy settings** when dealing with login issues
- For user permissions, make sure you're editing **Domain-level groups**, not just local groups
- Network configuration must be **exact** for communication between the DC and other VMs
- Patience is key — even silly mistakes help you learn more about AD and system behavior

