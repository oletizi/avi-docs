---
title: Authentication and Authorization for User Login
layout: 16.2
---
Avi Vantage requires valid credentials for login. Moreover, Vantage allows a successfully authenticated Vantage user to access only those resources for which the user is authorized.

Authentication and authorization can be performed in either of the following places:

* Locally, based on the <a href="/docs/16.2/user-accounts">local user database</a> in Vantage
* Remotely, using either of the following protocols:  
    * Lightweight Directory Access Protocol (<a href="/docs/16.2/ldap-authentication">LDAP</a>)
    * Terminal Access Controller Access Control System (<a href="/docs/16.2/tacacs-for-avi-vantage-users">TACACS+</a>) server 

To configure local authentication and authorization of a Vantage user, create the account in the local database. To be successfully authenticated, the username and password entered by the user must match the username and password of a user account created in Vantage. Authorization is based on the <a href="/docs/16.2/user-account-roles">role </a>assigned to the user account. If tenants are configured, the user's access is further defined by the tenant to which the user is assigned.

To configure remote authentication and authorization of a Vantage user:

1. Create an <a href="/docs/16.2/auth-profile">authentication/authorization (Auth) profile</a>. The profile specifies the AAA protocol to use (LDAP or TACACS+), and specific parameter values related to the selected protocol. For example, the authentication/authorization profile for TACACS+ specifies the TACACS+ server IP address, administrator credentials for accessing the server, and authorization attributes.
1. Within the Avi Controller system administration settings, change the method from local to remote, select the authentication/authorization profile, and map users to <a href="/docs/16.2/user-account-roles">roles</a> and <a href="/docs/16.2/tenants">tenants</a>.
1. Add the Vantage user account to the remote AAA server.
1. Vantage will fetch user Group Memberships (LDAP) and User Attribute Value pairs (LDAP or TACACS+) from the Remote AAA server using the Auth profile settings. The Group membership or User attribute values can be used to map Vantage users to a set of role and tenant pairs.
1. The roles and tenants on a user login can be assigned by adding Role and Tenant Mappings in Vantage.  
    * A mapping rule has a authorization criteria and resulting assignments of roles and tenants.
    * Mapping rule assignments take effect when the authorization criteria comprising of Group membership (LDAP) or Attribute value (LDAP or TACACS+) requirements are met.
    * A mapping rule assigns a role and tenant pair to a user session. The role assigned would only be valid in the context of the tenant.
    * When multiple mapping rules assign multiple roles for a given tenant, the most permissive role is enforced during the access.
    * When a user is assigned multiple tenants, the "Tenant View" option allows user to switch tenants in the GUI, and the "switchto <tenant>" option allows the user to work in a specific tenant's context in the CLI.
    * A mapping rule assignment can also be configured to make the login user a super user. A super user has the most privileged role, and access to all tenants. 

Examples of various mapping rules are in <a href="/docs/16.2/authorization-tenant-and-role-mapping-examples">this page</a>.

 

 
</tenant>