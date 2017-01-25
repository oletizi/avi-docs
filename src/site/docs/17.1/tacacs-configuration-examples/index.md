---
title: TACACS+ Configuration Examples
layout: default
---
 

### **ISE TACACS+ Server**

Cisco ISE is a security policy management platform that provides secure access to network resources. Cisco ISE functions as a policy decision point and enables enterprises to ensure compliance, enhance infrastructure security, and streamline service operations.

Given below are steps involved in setting up an ISE TACACS+ server as a remote authentication and authorization system for Avi Vantage.

* The ISE server is generally configured with external Identity Sources (in this case OpenLDAP). 

 

<a href="img/ISE-Authentication-setOpenLDAP.png"><img class="alignnone wp-image-11539" src="img/ISE-Authentication-setOpenLDAP.png" alt="ISE-Authentication-setOpenLDAP" width="650" height="339"></a>

 

 

<img class="alignnone wp-image-11552" src="img/ISE-OpenLDAP-Settings.png" alt="ISE-OpenLDAP-Settings" width="650" height="396">

 

<img class="alignnone wp-image-11551" src="img/ISE-OpenLDAP-ConnectionSettings.png" alt="ISE-OpenLDAP-ConnectionSettings" width="650" height="449">

<img class="alignnone wp-image-11550" src="img/ISE-OpenLDAP-GroupSearch.png" alt="ISE-OpenLDAP-GroupSearch" width="650" height="377">

 

* ISE LDAP settings used to fetch LDAP groups in order to use them for Authorization conditions 

<img class="alignnone wp-image-11549" src="img/ISE-OpenLDAP-Groups.png" alt="ISE-OpenLDAP-Groups" width="650" height="385">

* ISE Authorization conditions added for Users in the AD groups 

 

<img class="alignnone wp-image-11543" src="img/ISE-authrz-compount-conditions.png" alt="ISE-authrz-compount-conditions" width="650" height="232">

 

 

<img class="alignnone wp-image-11542" src="img/ISE-authrz-compound-condition.png" alt="ISE-authrz-compound-condition" width="650" height="308">

 

* ISE server should recognize all Avi Vantage Controller cluster nodes as valid Network Devices. 

 

<img class="alignnone wp-image-11547" src="img/ISE-NetworkDeviceProfile-Avi-Vantage.png" alt="ISE-NetworkDeviceProfile-Avi-Vantage" width="650" height="533">

 

<img class="alignnone wp-image-11548" src="img/ISE-NetworkDevice-Avi-Vantage.png" alt="ISE-NetworkDevice-Avi-Vantage" width="650" height="509">

 

* ISE requires shell profiles and TACACS+ profiles configured. 

 

<img class="alignnone wp-image-11546" src="img/ISE-tacacs-profile-shell-profiles.png" alt="ISE-tacacs-profile-shell-profiles" width="650" height="266">

 

<img class="alignnone wp-image-11545" src="img/ISE-tacacs-profile-shell-profile-RW.png" alt="ISE-tacacs-profile-shell-profile-RW" width="650" height="347">

 

* ISE device policy sets default condition updated to assign different shell profiles based on group membership. 

 

<img class="alignnone wp-image-11544" src="img/ISE-device-admin-policy-set-default.png" alt="ISE-device-admin-policy-set-default" width="650" height="319">

 

* The Avi Vantage TACACS+ auth profile should be configured with the same shared secret that was assigned to the device in ISE. The "service" attribute is generally required for authorization. In the case of an ACS server, service=shell is required for user authorization; while in the case of an ISE server, service=shell is known to cause authorization failure. 

 

<img class="alignnone wp-image-11541" src="img/TACACSsettings_ISE.png" alt="TACACS+settings_ISE" width="650" height="350">

 

* Avi Vantage TACACS+ authorization role and tenant mapping configured to assign different roles based on TACACS+ attribute value 

 

<img class="alignnone wp-image-11540" src="img/TACACSTenant_Role_Mapping.png" alt="TACACS+Tenant_Role_Mapping" width="650" height="333">

 

### **Shrubbery TAC_PLUS**

 

* TAC_PLUS server is a much simpler alternative to ISE/ACS. This is mostly relevant in development or testing environments. Conceptually, users are assigned to groups and groups have request and response attributes. 

 

<a href="img/TACACSshrubbery-conf.png"><img class="alignnone size-full wp-image-11555" src="img/TACACSshrubbery-conf.png" alt="TACACS+shrubbery-conf" width="502" height="701"></a>

 

<a href="img/TACACSshrubbery-command.png"><img class="alignnone size-full wp-image-11557" src="img/TACACSshrubbery-command.png" alt="TACACS+shrubbery-command" width="795" height="200"></a>

 

* Avi Vantage TACACS+ auth profile is configured the same way as that for ISE or ACS. 

### Other Articles of Interest:

<a href="/docs/17.1/protocol-ports-used-by-avi-vantage-for-management-communication/">Protocol Ports Used by Avi Vantage for Management Communication</a>
