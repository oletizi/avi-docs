---
title: Default System Accounts
layout: default
---
Avi Vantage inherently comes with several user accounts created.  These accounts serve specific purposes, and unlike custom user accounts, they may not be disabled or removed.

### admin

* This account exists on both the Avi Controller and Avi SEs
* It is the default administrator user-name for the system and cannot be changed
* Default shell is Linux bash  
    * From Linux use “shell” command to access the Avi CLI shell
    * admin is the only account whose Avi password is automatically synchronized with Linux
* Is a super-user in the Controller
* User is in sudoers list
* Default password is “admin” and UI system-setup workflow requires a new password  
    * Password is synchronized to the SEs
* Account has <a href="/docs/17.1/super-user-accounts/">super-user</a> status, with full access to all tenants
* This account is always authenticated via local user-db.  It does not use any configured remote authentication 

### cli

* Used to launch the CLI shell by logging into the Controller.  User will SSH to a Controller IP address, use cli as at the Linux username prompt, then be presented with the Avi CLI shell access username and password prompt, which requires their custom credentials
* Password-less from the Linux perspective with the CLI shell as the default shell that prompts for a username/password
* CLI shell is launched in a container with no persistent storage 

### aviseuser

* This account exists on Controller and SE
* Internal user for SE-to-Controller communication via SSH tunnel
* No password. Uses unique key-pair per SE
* User is not in sudoers list on the Controller
* User is in sudoers list on the SEs 

### avictlruser

* This account exists on Controller only
* Internal user for Controller-to-Controller communication via SSH
* No password. Uses unique key-pair per Controller
* User is in sudoers list 

 

