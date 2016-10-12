---
title: User Roles
layout: default
---
Each Avi Vantage <a href="user-accounts">user account</a> is associated with a role. The role defines the type of access the user has to each area of the Vantage system. 

Roles provide granular Role-Based Access Control (RBAC) within Avi Vantage. 

The role, in combination with the <a href="tenants">tenant </a>(optional), comprise the authorization settings for a Vantage user.

## Access Types

For each Vantage system area, the role can be one of the following:

* **Write:** User has full access to create, read, modify, and delete items. For example, the user may be able to create a virtual service, modify its properties, view its health and metrics, and later delete that virtual service. 
* **Read:** User may only read the existing configuration of the item. For example, the user may see how a virtual service is configured while being unable to view the current metrics, modify, or delete that virtual service. 
* **No Access:** User can neither see nor to modify this section of Vantage. For example, the user would be prohibited from creating, modifying, deleting, or even viewing (reading) any virtual services at all.  

## Pre-defined Vantage User Roles

Vantage comes with the following pre-defined roles:

* **Application-Admin:** User has Write access to the Application and Profiles sections of Avi Vantage, Read access to the Infrastructure settings, and No Access to the Account or System sections. 
* **Application-Operator:** User has Read access to the Application and Profiles sections of Avi Vantage, and No Access to the Infrastructure, Account, and System sections. 
* **Security-Admin:** User has Read/Write access only to the Templates &gt; Security section. 
* **System-Admin:** User has Write access to all sections of Avi Vantage. 
* **Tenant-Admin:** User has Write access to all sections of Avi Vantage except the System section, for which the user has No Access.  

To display a detailed list of the access settings for a role, click on the table row for that role. Here is an example of the detailed information for the Application-Admin role. (The example is truncated on the right side in this example but the information will display in full in the web interface.)

<a href="img/role-details.png"><img src="img/role-details.png" alt="role-details" class="alignnone wp-image-10439"></a>

Each user must be associated with at least one role. The role can be one of the pre-defined ones or a custom role.

If multitenancy is configured, a user can be assigned to more than one tenant, and can have a separate role for each tenant. 

## Create a Role

If none of the pre-defined roles exactly fit the access requirements for some user accounts, custom roles can be defined.

By default, access to each system area in a custom role is set to No Access. Access can be changed to read or write, for an entire system area or for individual resources within that system area.

For example, to allow write access to all profiles, click the (picture) icon in the title row for the Profiles system area:

<a href="img/custom-role1-1.png"><img src="img/custom-role1-1.png" alt="custom-role1" width="640" height="623" class="alignnone size-full wp-image-10443"></a>

To instead give access to only some of the resources withn a system area, select the access for each area. In this example, the role will have write access to some types of profiles but only read access to the other types: 

<a href="img/custom-role2.png"><img src="img/custom-role2.png" alt="custom-role2" width="638" height="622" class="alignnone size-full wp-image-10441"></a>

When there are multiple types of access within a system area, this is indicated by the Assorted icon: <a href="img/role-icon-assorted.png"><img src="img/role-icon-assorted.png" alt="role-icon-assorted" width="13" height="13" class="alignnone size-full wp-image-10451"></a>

To create a custom role:
<ol> 
 <li>Navigate to Administration &gt; Accounts &gt; Roles, and click Create.</li> 
 <li>Enter a name for the role.</li> 
 <li>Click one of the following icons to change access to a system area: 
  <ul> 
   <li>Write: <a href="img/role-icon-writeaccess.png"><img src="img/role-icon-writeaccess.png" alt="role-icon-writeaccess" width="13" height="14" class="alignnone size-full wp-image-10448"></a></li> 
   <li>Read: <a href="img/role-icon-readaccess.png"><img src="img/role-icon-readaccess.png" alt="role-icon-readaccess" width="11" height="12" class="alignnone size-full wp-image-10449"></a></li> 
   <li>No Access: <a href="img/role-icon-noaccess.png"><img src="img/role-icon-noaccess.png" alt="role-icon-noaccess" width="11" height="10" class="alignnone size-full wp-image-10450"></a></li> 
  </ul> </li> 
 <li>Click Save.</li> 
</ol> 

The new role appears in the roles table.

<a href="img/new-role-in-roletable.png"><img src="img/new-role-in-roletable.png" alt="new-role-in-roletable" width="853" height="376" class="alignnone size-full wp-image-10446"></a>

To edit a custom role, click the edit icon (not shown in example) to the right of the table entry. 

## Assigning a Role to a User

Roles can be assigned to both local and remote (LDAP, TACACS+) user accounts. The procedure differs depending on where the account is maintained.

### Local User Account

Roles can be assigned to a user account when the account is created or at any time later. In either case, select the role from the Role pull-down list in the configuration popup for the user account. 
<ol> 
 <li>Navigate to Administration &gt; Accounts &gt; Users.</li> 
 <li>If configuring a new account, click Create. Otherwise, if changing an existing account, click the edit icon in the row for the account.</li> 
 <li>Select the role from the Role pull-down list. If a custom role is needed but is not created, click Create.</li> 
</ol> 

### LDAP or TACACS+ User Accounts

If LDAP or TACACS+ remote authentication is used, roles can be assigned to users based on the following:

* LDAP group: A role can be assigned to users in any group, or specifically to users who either are or are not members of specific groups. 
* LDAP attributes: For users who match the LDAP group filter, the role is assigned to those users with any attributes and values, or who either do or do not have specific attributes and values. 

The mappings are configured within Avi Vantage rather than the LDAP or TACACS+ server. 

To map LDAP or TACACS+ users to Vantage roles, use the following steps. Multiple mappings can be configured if needed, for any combination of user group name and attribute:value pair.

Note: These steps assume that Vantage authentication/authorization is set to remote, and an LDAP or TACACS+ Auth profile (link) has been applied. 
<ol> 
 <li>Navigate to Administration &gt; Settings &gt; Authentication/Authorization.</li> 
 <li>Click New Mapping.</li> 
 <li>Select the filter for the LDAP group: 
  <ul> 
   <li>Any: Users in any LDAP group match the filter.</li> 
   <li>Member: Users <em><strong>must</strong></em> be members of the specified groups. If entering multiple group names, use commas between the names.</li> 
   <li>Not a Member: Users <em><strong>must not</strong></em> be members of the specified groups.</li> 
  </ul> </li> 
 <li>Select the filter for the LDAP attribute: 
  <ul> 
   <li>Any: Users match regardless of attributes or their values.</li> 
   <li>Contains: User <em><strong>must</strong></em> have the specified attribute, and the attribute must have one of the specified values.</li> 
   <li>Does Not Contain: User <em><strong>must not</strong></em> have the specified attribute and value(s). </li> 
  </ul> </li> 
 <li>Select the role from the User Role pull-down list: 
  <ul> 
   <li>From Select List: Displays a Roles pull-down list. Select the role from the list. </li> 
   <li>All: Assigns all roles.</li> 
   <li>Matching Attribute Value: Assigns the role whose name matches an attribute value from the LDAP server. </li> 
   <li>Matching Group Name: Assigns the role whose name matches a group name on the LDAP server.</li> 
  </ul> </li> 
 <li>If using multitenancy, tenants also can be mapped to users. (See (link to tenant page).)</li> 
 <li>Click Save.</li> 
 <li>The new mapping appears in the Tenant and Role Mapping table. </li> 
</ol> 