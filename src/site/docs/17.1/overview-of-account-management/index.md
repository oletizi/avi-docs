---
title: Overview of Account Management
layout: default
---
A valid account is required for access to Avi Vantage through the GUI, REST API, or CLI. Each user must be assigned a role which grants permissions and access to read or write to various objects within Avi Vantage. Accounts may optionally be restricted to specific tenants, and granted different roles within each tenant.
<a name="user_authentication"></a>
User accounts are maintained either locally in Avi Vantage or remotely via an external AAA server where authentication and authorization are performed.  Avi Vantage will first attempt to validate the account via local auth database, then remote auth.

For SSH access, the Controller will also attempt to authenticate the user via the underlying Linux after failing to find the user in the local or remote auth databases.  Users created via local or remote are not created in Linux and may not have Linux access, with the exception of the *admin* account.

 

### Local User Authentication

* <a href="/docs/17.1/manage-local-user-accounts/">Manage Local User Accounts</a>
* <a href="/docs/17.1/strong-password-enforcement/">Strong Password Enforcement</a>
* <a href="/docs/17.1/password-recovery/">Recover Lost Password</a>
* <a href="/docs/17.1/http-basic-auth-for-api-queries/">HTTP Basic Auth for API Queries</a> 

### Remote User Authentication

* <a href="/docs/17.1/ldap-authentication/">LDAP Authentication</a>
* <a href="/docs/17.1/ldap-auth-profile-test/">LDAP Authentication Profile Test</a>
* <a href="/docs/17.1/ldap-configuration-examples/">LDAP Configuration Examples</a>
* <a href="/docs/17.1/tacacs-authentication">TACACS+ Authentication</a>
* <a href="/docs/17.1/tacacs-configuration-examples/">TACACS+ Configuration Examples</a>
* <a href="/docs/17.1/keystone-authentication/">Keystone Authentication</a>
* <a href="/docs/17.1/cli-access/">CLI Access and Remote Auth</a> 

### Roles

* <a href="/docs/17.1/user-account-roles/">Roles</a> 

### Tenants

* <a href="/docs/17.1/tenants/">Tenants</a>
* <a href="/docs/17.1/switch-between-tenants/">Switch between Tenants</a>
* <a href="/docs/17.1/authorization-tenant-and-role-mapping-examples/">Authorization - Tenant and Role Mapping Examples</a>
* <a href="/docs/17.1/all-tenants-view/">All Tenants View</a> 

### Other

* <a href="/docs/17.1/super-user-accounts/">Super User Accounts</a>
* <a href="/docs/17.1/default-system-accounts/">Default System Accounts</a>
* <a href="/docs/17.1/user-account-self-service/">User Account Self-Service</a>
* <a href="/docs/17.1/user-account-security/">User Account Security</a> 

 

