---
layout: configuration-guide
title: Infrasture
---

### Users

A valid account is required for access to Avi Vantage via the GUI, API or CLI. Avi Vantage maintains these accounts locally or remotely. A user can be:

*   Suspended (disabled) or Active.

*   Assigned to one or more Tenants.

*   Assigned one Role per Tenant which grants permissions within the Tenant.

> Note: Only users whose Role have Write access to the Account section can add, edit, suspend, or remove user accounts.

The Administrator is a unique account that is used for initial setup of Avi Vantage. This account cannot be deleted.

#### Users Settings

Select Administration > Accounts > Users to open the Users tab.

This tab includes the following functions:

*   **Search**

*   **Create**

*   **Edit**

*   **Activate:** Select one or more suspended users and click Activate to reactivate a Suspended user.

*   **Suspend:** Select one or more active users and click Suspend to deactivate the selected users. A suspended user cannot access Avi Vantage via the GUI, API, or CLI. That user will receive a notice informing them of the account suspension when they attempt to sign in to Avi Vantage.

*   **Delete**

The table on this tab contains the following information for each user:

<a href="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_users_tab.jpg" rel="attachment wp-att-4946"><img src="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_users_tab.jpg" alt="admin_accounts_users_tab" width="1092" height="117" class="alignnone size-full wp-image-4946" /></a>

*   **User Name:** The account name used to log into Avi Vantage via GUI, API, or CLI.

*   **Status:** Status of the user account.

*   **Full name:** Full name of the user.

*   **Email:** Email address of the user.

*   **Tenants:** Tenants the user is allowed to access. (The role assigned to the user defines the access level the user has to specific resources types within the tenant.)

*   **Last Signed In:** Date and time that this user last signed in to Avi Vantage via GUI, API, or CLI.

#### Create a User

The Create User and Edit User popups share the same interface.

<a href="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_users_create.jpg" rel="attachment wp-att-4948"><img src="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_users_create.jpg" alt="admin_accounts_users_create" width="836" height="507" class="alignnone size-full wp-image-4948" /></a>

Enter the following information to create or edit a role:

*   **Username:** Name that the user will supply when signing into Avi Vantage, such as `jdoe` or `jdoe@avinetworks.com`.

*   **Password:** You may either enter a case-sensitive password in this field or click the Generate button to create a random password for the new User.

*   **Full Name:** Full name of the user, such as John Doe.

*   **Email:** Email address of the user. This field is used when a user loses their password and requests to have it reset. See Password Recovery.

*   **Linux Super User:** This checkbox grants root level access to the Linux operating system that underlies both the Avi Vantage Controller and Service Engines.

*   **Tenant:** A user must be assigned a Role within at least one Tenant and may be assigned a Role in each Tenants if you have configured multiple Tenants. Click the Select Tenants button to open the list of configured Tenants, and then select an additional Tenant that you want the user to access. Repeat this for each additional Tenant you want to make accessible to this user.

*   **Role:** After selecting each Tenant, you must assign a Role to the user for that Tenant, which determines the level of access that the user has to Avi Vantage for that Tenant. See Roles.

*   **Activated/Suspended:** By default, a new user is created in an Active state. The green Enabled switch at the top of the New/Edit User popup allows you to create the user in a Suspended or disabled state by toggling this option off; this switch is green when the user is active, and red when the user is suspended.

*   Click **Save** to finish creating or editing the user and return to the Users tab.

#### User Preferences

A user who is logged into Avi Vantage may edit their account settings by clicking their username in the top right corner of the Avi Vantage UI screen and then selecting My Account to open the Edit My Account popup.

![][1]

Edit the following default settings for your account:

*   **Name:** Your full name.

*   **Email:** Your email address. This is the address that Avi Vantage will use when you request a password recovery.

*   **Username:** Name assigned to this account and used for signing in to Avi Vantage. This field is display only; you cannot change this setting.

*   **Full Name:** The name of the user, such as John Doe.

*   **Password:** Enter a new password in the New Password and New Password Again fields (case sensitive).

*   Display settings are account-specific preferences that are used each time you sign into Avi Vantage. Changes made to the display settings while navigating the Vantage interface, such as the Display time, will be used for the duration of that session; signing out and back in restores the default preferences stored here. The available options are:
    
    *   **Time:** View timestamps, such as logs or analytics metrics, in either UTC Time (Universal Time Coordinated) or Local Time. Avi Vantage obtains the time from the specified NTP server.
    
    *   **Default Timeframe:** Select the time period over which to display information. See Display Time.
    
    *   **Metric Value:** Change the view of pages such as the Analytics tab of the Virtual Services Details page, to show data points such as the End to End Timing chart as either an Average of the metrics data for the timeframe selected or the most Current data point.
    
    *   **Display Type:** Select either a condensed or expanded view of the Metrics Tiles for tabs that include them.
    
    *   **Menu Position:** Move the Metrics tiles to the right or to the left side of the Analytics tab.

*   Save to close the Edit My Account popup and return to the previous page/tab.

### Roles

Each User created within Avi Vantage must be assigned a Role, which grants access to resources within Vantage. A User with access to multiple Tenants may have different Roles on a per-Tenant basis. For instance, a User may be given write privileges to the Applications sections of Avi Vantage (virtual services and pools), but only read privileges to all other sections. This access control is maintained for the GUI, API, and CLI.

Creating custom Roles allows you to assign granular Role-Based Access Control (RBAC) within Avi Vantage. Each user may receive one of the following three access levels to the various areas of the Avi Vantage interface:

*   **Write:** User has full access to create, read, modify, and delete items. For example, the user may be able to create a virtual service, modify its properties, view its health and metrics, and later delete that Virtual Server.

*   **Read:** User may only read the existing configuration of the item. For example, the user may see how a virtual service is configured while being unable to view the current metrics, modify, or delete that Virtual Server.

*   **No Access:** User can neither see nor to modify this section of Avi Vantage. For example, the user would not be able to see the virtual service at all.

Several default roles exist, which provide common combinations of access levels.

*   **Application-Admin:** User has Write access to the Application and Profiles sections of Avi Vantage, Read access to the Infrastructure settings, and No Access to the Account or System sections.

*   **Application-Operator:** User has Read access to the Application and Profiles sections of Avi Vantage, and No Access to the Infrastructure, Account, and System sections.

*   **Security-Admin:** User has Read/Write access only to the Templates > Security section.

*   **System-Admin:** User has Write access to all sections of Avi Vantage.

*   **Tenant-Admin:** User has Write access to all sections of Avi Vantage except the System section, for which the user has No Access.

#### Roles Settings

Select Administration > Accounts > Roles to open the Roles tab. This tab includes the following functions:

*   **Search**

*   **Create**

*   **Edit**

*   **Delete**

The table on this tab contains the following information for each role:

*   **Name:** Name of the Role.

*   **Application:** Access level (write, read, or no access) granted to the Role for the Application section of Avi Vantage.

*   **Profiles:** Access level granted to the Role for the Profiles section of Avi Vantage.

*   **Infrastructure:** Access level granted to the Role for the Infrastructure section of Avi Vantage.

*   **Account:** Access level granted to the Role for the Account section of Avi Vantage.

*   **System:** Access level granted to the Role for the System section of Avi Vantage.

#### Create a Role

The Create Role and Edit Role popups share the same interface. To create or edit a Role:

<a href="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_roles_create-edit.jpg" rel="attachment wp-att-4943"><img src="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_accounts_roles_create-edit.jpg" alt="admin_accounts_roles_create-edit" width="774" height="558" class="alignnone size-full wp-image-4943" /></a>

*   **Name:** Enter a name in the Role field.

*   **Access Level:** Select the desired access level for each of the following sections within Avi Vantage by clicking the appropriate button for each Role (write, read, or no access):
    
    *   **Application:** Access level (write, read, or no access) granted to the Role for the Application section of Avi Vantage, which includes Virtual services and pools.
    
    *   **Profiles:** Access level granted to the Role for the Profiles section of Avi Vantage.
    
    *   **Group & Script:** Access level granted to the Role for the Templates > Groups section of Avi Vantage.
    
    *   **Security:** Access level granted to the Role for the Templates > Security section of Avi Vantage.
    
    *   **Operations:** Access level granted to the Role for the Operations section of Avi Vantage.
    
    *   **Infrastructure:** Access level granted to the Role for the Infrastructure section of Avi Vantage.
    
    *   **Administration:** Access level granted to the Role for the Administration of Avi Vantage.
    
    *   **Accounts:** Access level granted to the Role for the Account section of Avi Vantage, which includes Users, Roles, and Tenants.
    
    The Assorted icon expands or hides the list of resource types within an access level. When the list is expanded, access can be configured for individual resource types within the access level.

### Tenants

A Tenant is an isolated instance of Avi Vantage. An administrator who logs into one Tenant cannot see or view the configuration of other Tenants within Avi Vantage. When working with Tenants:

*   If Avi Vantage has been configured with more than one Tenant and if that administrator has been granted access to multiple Tenants, then clicking the username at the top right of the Avi Vantage screen displays a list of available Tenants. Switching to a different Tenant switches the view to show only the configuration for the newly-selected Tenant.
    
    If Avi Vantage has only been configured with the default Tenant and no others, then all new users and objects (such as pools and virtual services) are assigned to the default Tenant.

*   You can create one or more additional Tenants and move both new and existing users into the new Tenants by editing a user account.

*   An individual Avi Vantage user may have roles in more than one Tenant; in this case, any new object created by that user will be assigned to the Tenant in which the object was created.

*   Service Engine Groups may be created for each Tenant, thereby isolating the data plane resources and preventing contention.

#### Tenants Settings

Select Administration > Accounts > Tenants to open the Tenants tab. This tab includes the following functions:

*   **Search**

*   **Create**

*   **Edit**

*   **Delete**

The table on this tab contains the following information for each Tenant:

![][2]

*   **Name:** Name of the Tenant.

*   **Num Users:** Number of users with one or more roles in that Tenant.

*   **Admin Users:** Usernames of users with administrator privileges in a Tenant.

*   **Other Users:** Usernames of users with non-administrator privileges in a Tenant.

#### Create a Tenant

The Create Tenant and Edit Tenant popups share the same interface.

![][3]

To create or edit a Tenant:

*   **Name:** Enter a Name for the new Tenant.

*   **Save** to finish creating the new Tenant and return to the Tenants tab.

Once the Tenant has been created, users can be moved into or created in the Tenant.

 [1]: /wp-content/uploads/2016/01/admin_accounts_users_edit-account.jpg
 [2]: http://kb.avinetworks.com/wp-content/uploads/2016/01/admin_accounts_tenants_tab.jpg
 [3]: http://kb.avinetworks.com/wp-content/uploads/2016/01/admin_accounts_tenants_create-edit.jpg