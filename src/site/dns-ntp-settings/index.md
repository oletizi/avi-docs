---
title: DNS / NTP Settings
layout: default
---
Avi Vantage requires access to valid DNS and NTP servers for operation. Use of an NTP server is especially critical. Vantage cannot function properly without an NTP server.

### View or Modify DNS / NTP Settings

1. Navigate to Administration > Settings > DNS/NTP.
1. To edit the settings, click on the edit icon.
1. Click Save when finished.

### DNS / NTP Settings

* **DNS Address:** IP address of the domain name server. If a DNS server is not configured, Vantage will not be able to accept names for load balanced servers, virtual services, mail servers, and similar inputs.
* **DNS Search Domain:** Local domain name, which will be appended to a name that is not fully qualified. For instance, if the DNS Search Domain is set to avinetworks.com, and the name to be resolved is www, then Vantage will lookup www.avinetworks.com.
* **NTP Address:** The IP address of an NTP server that Avi Vantage will use to maintain date and time. NTP will be used to set the clock on the Avi Controllers. The Avi Controllers will then set the clock on the Avi Service Engines (SEs). If no NTP server is configured or accessible, the Avi Controller clock may drift or be off, but the Avi SEs will still be in sync with the Avi Controller time.
* **Auto upload diagnostic information to Avi Networks:** When selected, Avi Vantage will automatically send utilization data to Avi Networks. This information contains crash reports and system logs which Avi Networks may use to diagnose issues. It does not contain sensitive information, such as passwords or SSL certificates. For more information on the exact data sent to Avi Networks, contact Avi technical support.