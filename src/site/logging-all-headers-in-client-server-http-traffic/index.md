---
title: Logging All Headers in Client-Server HTTP Traffic
layout: default
---
Vantage provides extensive logging options for virtual service traffic. Among these options is an option to enable logging of all headers in HTTP traffic between clients and servers. The option to log all headers is available for HTTP policies and for client log filters. HTTP polices and client log filters each are part of an individual virtual service's configuration.

### Notes

* 
In Avi Vantage versions prior to 16.1, the option to log all headers applies only to client-to-server traffic but not to server-to-client traffic. In 16.1 and later, the option to log all headers applies to both traffic directions.
* 
Client logging can be enabled without defining individual log filters. This logs all the virtual service's traffic. As a best practice, use log filters to narrow the scope of the logs to capture, or leave logging of all traffic enabled only temporarily while troubleshooting.

## Enabling All Header Logging

Within a virtual service's configuration, logging of all headers can be enabled in the following places:

* 
**Rule tab:** On the Rule tab of a virtual service's configuration, logging can be enabled individually for the virtual service's HTTP security policy, HTTP request policy, and HTTP response policy. Click Log with headers. The option applies to all packets that match the policy.

<a href="img/log-with-headers-http-policies-1.png"><img src="img/log-with-headers-http-policies-1.png" alt="log-with-headers-http-policies" width="1010" height="603"></a>
* 
**Analytics tab:** On the Analytics tab of a virtual service's configuration, log filters can be defined, and the option to include all headers can be enabled. Click Add Client Log Filter, and check (enable) Log all headers. The option applies to all packets that match any of the client log filters defined on the tab. If no log filters are defined on the tab, the option applies to all packets for the virtual service.

<a href="img/log-with-headers-analytics2.png"><img src="img/log-with-headers-analytics2.png" alt="log-with-headers-analytics2" width="1012" height="603"></a>

These header logging settings for HTTP polices and for client log filters are independent of one another. For example, enabling all-header logging on the virtual service's Analytics tab does not enable all-header logging in any of the HTTP policies on the Rules tab. Likewise, enabling the option in an HTTP policy does not enable the option for client logging or for the other HTTP policies.

## Viewing the Header Information in Logs

All the logs can be viewed in the same place, on the Analytics page for the client.

To view client logs:

1. 
Navigate to Applications > Dashboard.
1. 
Click on the icon for the virtual service.
1. 
Click Logs.
1. 
*(optional)* Select the time period of logs to display from the Displaying pull-down menu.
1. 
To display details for a log, click on the plus sign next to the log entry.