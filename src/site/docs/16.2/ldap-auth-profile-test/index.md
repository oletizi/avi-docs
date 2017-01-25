---
title: LDAP Authentication Profile Testing
layout: layout162
---
Avi Vantage provides an option for testing authentication profiles configured on the Avi Controller.

## Testing an Authentication Profile

After an authentication profile is created, it is added to the list on the Templates > Security > Auth Profile page. Click the verify icon <img class="alignnone size-full wp-image-5856" src="img/auth-profile-verify-icon.png" alt="auth-profile-verify-icon" width="20" height="21"> next to a profile name to test that profile. A popup appears, prompting for information needed to perform the test.

 

<a href="img/Screen-Shot-2016-08-03-at-2.46.43-PM-1.png"><img class="alignnone  wp-image-11266" src="img/Screen-Shot-2016-08-03-at-2.46.43-PM-1.png" alt="LDAP Profiles" width="807" height="416"></a>

## Test Options for LDAP Authentication Profiles

The popup for testing an LDAP authentication profile requires some information to be entered. The information is used in the request Vantage sends to the LDAP server to test the profile.

### Test Inputs for Anonymous Bind

If the LDAP authentication profile is configured to use anonymous binding for authentication requests, the popup for testing the profile prompts for the LDAP user's username and password. Testing whether a user can bind successfully verifies that the LDAP authentication profile is configured correctly to authenticate users with the same user DN pattern.

### <a href="img/Screen-Shot-2016-08-03-at-2.55.24-PM.png">   </a><a href="img/Screen-Shot-2016-08-03-at-2.55.24-PM.png"><img class="alignnone wp-image-11268" src="img/Screen-Shot-2016-08-03-at-2.55.24-PM.png" alt="Screen Shot 2016-08-03 at 2.55.24 PM" width="650" height="453"></a><a href="img/Screen-Shot-2016-08-03-at-2.55.43-PM.png">  <img class="alignnone wp-image-11267" src="img/Screen-Shot-2016-08-03-at-2.55.43-PM.png" alt="Screen Shot 2016-08-03 at 2.55.43 PM" width="650" height="451"></a>

 

### Test Inputs for Administrator Bind

If the LDAP authentication profile is configured to use administrator binding for authentication requests, one of the following types of information can be specified on the verification popup for the profile.

 

* **Test user entry:** Searches the LDAP server's database for the specified username, and returns the corresponding user entry from the LDAP database. This option is useful for listing all attribute key-value pairs for any given user. The user search settings configured in the authentication profile are used. If the Username field is left empty, Vantage pulls the entire list of user records from the LDAP database. (While this causes no harm, it can take some time to fulfill, which may be undesirable in some deployments.) 

 

<a href="img/Screen-Shot-2016-08-03-at-3.00.21-PM.png"><img class="alignnone wp-image-11270" src="img/Screen-Shot-2016-08-03-at-3.00.21-PM.png" alt="LDAP Test User 1" width="650" height="453"></a>     <a href="img/Screen-Shot-2016-08-03-at-3.06.44-PM.png"><img class="alignnone wp-image-11271" src="img/Screen-Shot-2016-08-03-at-3.06.44-PM.png" alt="LDAP Test User 2" width="650" height="453"></a>

 

* **Test user group membership:** Lists all group memberships for the specified user. The group search settings configured in the authentication profile are used. If the Username field is left empty, all groups are returned. 

 

<a href="img/Screen-Shot-2016-08-03-at-2.59.37-PM.png"><img class="alignnone wp-image-11273" src="img/Screen-Shot-2016-08-03-at-2.59.37-PM.png" alt="LDAP Test Group 1" width="650" height="453"></a>

 

* **Test base DN:** Returns all objects under the base DN. This option is useful for testing administrator permissions and for reading the DN tree of the LDAP server. 

<a href="img/Screen-Shot-2016-08-03-at-3.00.48-PM.png"><img class="alignnone wp-image-11274" src="img/Screen-Shot-2016-08-03-at-3.00.48-PM.png" alt="LDAP Test DN" width="650" height="453"></a>

 

 

**Error Scenarios:**  The test page can identify some common error scenarios.

 

* LDAP server IP/port incorrect. 

 

<a href="img/Screen-Shot-2016-08-03-at-3.02.22-PM.png"><img class="alignnone wp-image-11269" src="img/Screen-Shot-2016-08-03-at-3.02.22-PM.png" alt="LDAP Test bind failed" width="650" height="452"></a>

 

* Bad username or User Search settings are incorrect 

 

<a href="img/Screen-Shot-2016-08-03-at-3.06.44-PM.png"><img class="alignnone wp-image-11271" src="img/Screen-Shot-2016-08-03-at-3.06.44-PM.png" alt="LDAP Test User 2" width="650" height="453"></a>

 

* User is either not a member of any group or Group Search settings are incorrect 

 

<a href="img/Screen-Shot-2016-08-03-at-3.12.26-PM.png"><img class="alignnone wp-image-11276" src="img/Screen-Shot-2016-08-03-at-3.12.26-PM.png" alt="Screen Shot 2016-08-03 at 3.12.26 PM" width="650" height="450"></a>

 

 
