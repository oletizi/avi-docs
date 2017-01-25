---
title: DNS / NTP Settings
layout: 16.2
---
Avi Vantage requires access to valid DNS and NTP servers for operation. Use of an NTP server is especially critical. Vantage cannot function properly without an NTP server.

### View or Modify DNS / NTP Settings

<ol> 
 <li>Navigate to Administration &gt; Settings &gt; DNS/NTP.</li> 
 <li>To edit the settings, click on the edit icon.</li> 
 <li>Click Save when finished.</li> 
</ol> 

### DNS / NTP Settings

* **DNS Resolver(s):** A comma-delimited list of DNS server IP addresses. If a DNS server is not configured, Vantage will not be able to accept names for load-balanced servers, virtual services, mail servers, and similar inputs.
* **DNS Search Domain:** Local domain name, which will be appended to a name that is not fully qualified. For instance, if the DNS Search Domain is set to avinetworks.com, and the name to be resolved is www, then Vantage will lookup www.avinetworks.com.
* **NTP Server(s):** A comma-delimited list of NTP server names or IP addresses. Avi Vantage will use an NTP server to maintain date and time. NTP will be used to set the clock on the Avi Controllers. The Avi Controllers will then set the clock on the Avi Service Engines (SEs). If no NTP server is configured nor accessible, the Avi Controller clock may drift or be off, but the Avi SEs will still be in sync with the Avi Controller time.
* **Auto upload diagnostic information to Avi Networks:** When selected, Avi Vantage will automatically send utilization data to Avi Networks. This information contains crash reports and system logs which Avi Networks may use to diagnose issues. Although it does not contain sensitive information, such as passwords or SSL certificates, it is disabled by default. For more information on the exact data sent to Avi Networks, contact Avi technical support. 