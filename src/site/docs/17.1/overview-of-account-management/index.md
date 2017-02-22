---
title: Overview of Account Management
layout: layout163
---
A valid account is required for access to Avi Vantage through the GUI, REST API, or CLI. Each user must be assigned a role which grants permissions and access to read or write to various objects within Avi Vantage. Accounts may optionally be restricted to specific tenants, and granted different roles within each tenant.
<a name="user_authentication"></a>
User accounts are maintained either locally in Avi Vantage or remotely via an external AAA server where authentication and authorization are performed.  Avi Vantage will first attempt to validate the account via local auth database, then remote auth.

For SSH access, the Controller will also attempt to authenticate the user via the underlying Linux after failing to find the user in the local or remote auth databases.  Users created via local or remote are not created in Linux and may not have Linux access, with the exception of the *admin* account.

 

### Local User Authentication

* <a href="{% vpath %}/manage-local-user-accounts/">Manage Local User Accounts</a>
* <a href="{% vpath %}/strong-password-enforcement/">Strong Password Enforcement</a>
* <a href="{% vpath %}/password-recovery/">Recover Lost Password</a>
* <a href="{% vpath %}/http-basic-auth-for-api-queries/">HTTP Basic Auth for API Queries</a>

### Remote User Authentication

* <a href="{% vpath %}/ldap-authentication/">LDAP Authentication</a>
* <a href="{% vpath %}/ldap-auth-profile-test/">LDAP Authentication Profile Test</a>
* <a href="{% vpath %}/ldap-configuration-examples/">LDAP Configuration Examples</a>
* <a href="{% vpath %}/tacacs-authentication">TACACS+ Authentication</a>
* <a href="{% vpath %}/tacacs-configuration-examples/">TACACS+ Configuration Examples</a>
* <a href="{% vpath %}/keystone-authentication/">Keystone Authentication</a>
* <a href="{% vpath %}/cli-access/">CLI Access and Remote Auth</a>

### Roles

* <a href="{% vpath %}/user-account-roles/">Roles</a>

### Tenants

* <a href="{% vpath %}/tenants/">Tenants</a>
* <a href="{% vpath %}/switch-between-tenants/">Switch between Tenants</a>
* <a href="{% vpath %}/authorization-tenant-and-role-mapping-examples/">Authorization - Tenant and Role Mapping Examples</a>
* <a href="{% vpath %}/all-tenants-view/">All Tenants View</a>

### Other

* <a href="{% vpath %}/super-user-accounts/">Super User Accounts</a>
* <a href="{% vpath %}/default-system-accounts/">Default System Accounts</a>
* <a href="{% vpath %}/user-account-self-service/">User Account Self-Service</a>
* <a href="{% vpath %}/user-account-security/">User Account Security</a>

 

