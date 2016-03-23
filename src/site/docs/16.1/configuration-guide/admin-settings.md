---
layout: configuration-guide
title: Settings
---

### Access Settings Tab

Select Administration > Settings > Access Settings to open the System Access tab.

These options govern how administrators may access the Avi Controller UI.

*   **HTTPS Access to System:** Enables SSL/TLS access to the Avi Vantage's GUI and REST API. When this option is enabled, the SSL Profile and SSL/TLS Certificate fields must be populated.

*   **HTTP Access to System:** Allow HTTP access to the Avi Cloud ADC's GUI and REST API. This option is insecure and not recommended.

*   **Redirect HTTP to HTTPS:** When HTTP Access to System is disabled, enabling this option will automatically redirect administrators to the HTTPS interface for the GUI and API.

*   **SSL Profile:** Select an SSL Profile to complete the HTTPS Access. This profile is from the Templates > Security > SSL Profiles, which is also referenced by SSL enabled Virtual Services.

*   **SSL/TLS Certificate:** Select an SSL certificate to present to clients connecting to the Avi Vantage GUI. This may be either an RSA or Elliptic Curve certificate.

### DNS / NTP Settings

Select Administration > Settings > DNS/NTP to open the DNS/NTP tab of the Settings page. This tab presents the following information:

![][1]

*   **DNS Address:** IP address of the domain name server.

*   **DNS Search Domain:** Local domain name, which will be appended to a name that is not fully qualified. For instance, if the DNS Search Domain is set to avinetworks.com, and the name to be resolved is www, then Avi Vantage will lookup www.avinetworks.com.

*   **NTP Address:** The IP address of a Network Time Protocol server that Avi Vantage will use to maintain date and time. NTP will be used to set the clock on the Controllers. The Controllers will then set the clock on the Service Engines. If no NTP is configured or accessible, the Controllers clock may drift or be off, but the Service Engines will still be in sync with the Controllers time.

*   **Auto upload diagnostic information to Avi Networks:** When selected, Avi Vantage will automatically send utilization data to Avi Networks. This information contains crash reports and system logs which Avi may use to diagnose issues. It does not contain sensitive information, such as passwords or SSL certificates. For more information on the exact data sent to Avi Networks, contact Avi's technical support.

> Click the blue **Edit** icon to open the Update System Settings popup.

#### Update DNS/NTP Settings

The blue Edit icon on the DNS/NTP tab of the Settings page opens the Update System Settings popup, which configures the basic network settings used by Avi Vantage. These settings were initially defined during the first time setup.

![][2]

Enter the following information to update the DNS/NTP settings:

*   **DNS Address:** Enter the IP address of the Domain Name Server. When a name server is not configured, Avi Vantage will not be able to accept names for load balanced servers, Virtual Services, mail servers, and similar inputs.

*   **DNS Search Domain:** Local domain name (optional). This will be appended to a name that is not fully qualified. For example, if the DNS Search Domain is set to avinetworks.com, and the name to be resolved is www, Avi Vantage will lookup www.avinetworks.com.

*   **NTP Address:** IP address or hostname of the Network Time Protocol servers that Avi Vantage will use to obtain the correct local time. If no NTP server is defined, Avi Vantage will use the time from the hypervisor used by the Controller. Avi Vantage Controllers and Service Engines will remain in sync with each other, but not necessarily with the outside world. This may affect time stamps for logs or other areas where times may need to be correlated with external devices for troubleshooting.

*   **Auto upload diagnostic information to Avi Networks:** Avi Vantage will automatically send diagnostic and troubleshooting information to Avi Networks, such as crash reports. For instance, if Avi Vantage experiences a crash, a report would be sent to Avi Networks with details about the issue. Sensitive information such as passwords and SSL certificates will not be transmitted. Clearing this checkbox disables automatic uploads. Contact Avi Network's technical support for current details about the exact data that is captured.

### License Tab

Select Administration > Settings > Licensing to open the Licensing tab.

Avi Vantage is bound by a license that determines the features and capacity available to a Controller cluster installation. When a valid license file is not available, Avi Vantage runs in Free Trial mode, which limits the total system capacity. In this mode, Vantage may only load balance two servers within a pool, and is limited to two Service Engines. All functionality, such as SSL or DataScripts are still available.

A new or additional license may be added at any time to provide increased capacity. Once a license has been added to a Controller, it has been consumed and cannot be removed.

![][3]

This tab presents the following information:

*   **License Summary:**
    
    *   **Licensed Max Pool Members:** Avi Cloud ADC is metered by the maximum number of servers that may be configured within Pools. This number is the total number of all Pool members at any time. The max shows how many Pool members the system is licensed to support. This number may be cumulative from multiple licenses.
    
    *   **Currently Used Pool Members:** This stat shows the number of Pool members currently configured across the system. If more servers are added to a Pool than the license will allow, the process of saving the change will fail and an error will be generated. As servers are removed from Pool or Pools are deleted, the current Pool member's number will drop.

*   **Licenses:**
    
    *   **Description:** The description field denotes the company or organization that owns the license.
    
    *   **License ID:** The unique serial number for the license file.
    
    *   **Type:** The specific license type, such as production or trial. This entry also may state the number of nodes, or Pool members and the length of time the license is valid.
    
    *   **Licensed Pool Members:** The number of Pool members this license will add to the Licensed Max Pool Members stat.
    
    *   **Expiry:** The length of time this license is considered valid. If all licenses have expired, Avi Vantage will revert to a trial mode, which allows all features but limits the configuration to supporting the minimum number of Pool members.

Click the green Upload License File button to open a popup window that allows you to navigate to, select, and upload a new license file to activate, reactivate, or modify your Avi Vantage license.

### Email/SMTP Tab

Select Administration > Settings > Email/SMTP to open the Email/SMTP tab.

Avi Vantage may proactively send emails. This may be done for password reset operations, or to send defined Alert Actions to administrators or monitoring systems. Emails are sent from the Avi Controller, which means the Controller will require DNS and network access to a destination email server.

The SMTP Source is where the email will be source from when the Avi Controller is sending an email.

*   **None:** When set to None, Avi Vantage will not send emails.

*   **Local Host:** The Avi Controller will send the email from a local host. Some enterprise email servers may not accept this method.
    
    *   **From Address:** The email field that denotes who sent the email.

*   **SMTP Server:** Avi Vantage can point to a remote SMTP server to use for sending emails. This method is generally more trusted by security conscious enterprise environments.
    
    *   **Username:** The username to authenticate to the mail server.
    
    *   **Password:** The password to authenticate to the mail server.
    
    *   **SMTP Server:** The mail server host.
    
    *   **Port Number:** The service port for SMTP, generally 25.
    
    *   **From Address:** The email field that denotes who sent the email.

 [1]: img/admin_settings_dnsntp_tab.jpg
 [2]: img/admin_settings_dnsntp_updating.jpg
 [3]: img/admin_settings_license.jpg