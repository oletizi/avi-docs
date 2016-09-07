---
title: Strong Password Enforcement
layout: default
---
The default deployment of Avi Vantage creates an admin account for access to the system. This initial account does not mandate any specific password requirements. Additional user accounts can be created, either local username/password, or remote accounts, which are tied into an external auth system such as LDAP.

For local accounts, it is possible to enable strong password enforcement. Enabling this option does not impact the passwords of existing accounts. It only impacts newly created accounts, or existing accounts that are attempting to change their password. The strong password enforcement feature does not affect remotely authenticated accounts. It also does not affect the password requirements for Vantage's underlying Linux operating system.

### Password Requirements (Strong Enforcement Enabled)

### 16.2

* Minimum of 8 characters
* Contains at least one character in each of 3 of the 4 following categories:

* Uppercase letters
* Lowercase letters
* Digits
* Special characters

### 16.1 and earlier

* Minimum of 8 characters
* At least 3 unique characters
* At least 1 number

### Default

Prior to Avi Vantage version 16.2, strong password enforcement is disabled by default. Strong password enforcement is enabled by default in new deployments using 16.2.

If a 16.1 deployment is upgraded to 16.2, strong password enforcement is disabled, for backward compatibility with existing passwords. In either release, the setting can be changed.

Note: Only an account that has the System Administrator role may change this setting.

### Enabling Strong Password Enforcement

Strong password enforcement may be enabled using the CLI commands shown below.
bash/# **shell** : > **configure systemconfiguration** : systemconfiguration> **portal_configuration** : systemconfiguration:portal_configuration> **password_strength_check** Overwriting the previously entered value for password_strength_check : systemconfiguration:portal_configuration> **exit** : systemconfiguration> **exit**

Truncated view of the results:

+-------------------------------------+----------------------------------+ | Field | Value | +-------------------------------------+----------------------------------+ | uuid | default | | portal_configuration | | | enable_https | True | | redirect_to_https | True | | enable_http | True | | enable_clickjacking_protection | True | | allow_basic_authentication | False | | **password_strength_check** | **True** | +-------------------------------------+----------------------------------+

### Disabling Strong Password Enforcement

bash/# **shell** : > **configure systemconfiguration** : systemconfiguration> **portal_configuration** : systemconfiguration:portal_configuration> **no password_strength_check** Overwriting the previously entered value for password_strength_check : systemconfiguration:portal_configuration> **exit** : systemconfiguration> **exit**