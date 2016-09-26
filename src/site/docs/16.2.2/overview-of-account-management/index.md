---
title: Overview of Account Management
layout: default
---
A valid account is required for access to Avi Vantage through the GUI, REST API, or CLI. Each user must be assigned a role which grants permissions and access to read or write to various objects within Vantage. Accounts may optionally be restricted to specific tenants, and granted different roles within each tenant.

User accounts are maintained either locally in Vantage or remotely via an external AAA server where authentication and authorization are performed.  Vantage will first attempt to validate the account via local auth database, then remote auth.

For SSH access, the Controller will also attempt to authenticate the user via the underlying Linux after failing to find the user in the local or remote auth databases.  Users created via local or remote are not created in Linux and may not have Linux access, with the exception of the *admin* account.

### <a href="img/Login.png"><img class="size-full wp-image-13315 alignright" src="img/Login.png" alt="Login" width="245" height="235"></a>Local User Authentication

* <a href="/docs/latest/manage-local-user-accounts">Manage Local User Accounts</a>
* <a href="/docs/latest/strong-password-enforcement">Strong Password Enforcement</a>
* <a href="/docs/latest/password-recovery">Recover Lost Password</a> 

### Remote User Authentication

* <a href="/docs/latest/ldap-auth-profile-test">LDAP Authentication Profile Test</a>
* <a href="/docs/latest/ldap-configuration-examples">LDAP Configuration Examples</a>
* <a href="/docs/latest/tacacs-authentication">TACACS+ Authentication</a>
* <a href="/docs/latest/tacacs-configuration-examples">TACACS+ Configuration Examples</a>
* <a href="/docs/latest/keystone-authentication">Keystone Authentication</a>
* <a href="/docs/latest/cli-access">CLI Access and Remote Auth</a> 

### Roles

* <a href="/docs/latest/user-account-roles">Roles</a> 

### Tenants

* <a href="/docs/latest/tenants">Tenants</a>
* <a href="/docs/latest/switch-between-tenants">Switch between Tenants</a>
* <a href="/docs/latest/authorization-tenant-and-role-mapping-examples">Authorization - Tenant and Role Mapping Examples</a>
* <a href="/docs/latest/all-tenants-view">All Tenants View</a> 

### Other

* <a href="/docs/latest/super-user-accounts">Super User Accounts</a>
* <a href="/docs/latest/default-system-accounts">Default System Accounts</a>
* <a href="/docs/latest/user-account-self-service">User Account Self-Service</a> 

 

