---
title: DNS Health Monitor
layout: default
---
This article covers the specific configuration for this monitor type.  See the <a href="/docs/latest/overview-of-health-monitors">Overview of Health Monitors</a> article for general monitor information, implementation, and other monitor types.

The DNS health monitor validates the health of DNS servers by sending a UDP DNS request and comparing the response IP address.

### General Monitor Configuration

* **Send Interval**:  Frequency at which the health monitor initiates a server check, in seconds.
* **Receive Timeout**:  Maximum amount of time before the server must return a valid response to the health monitor, in seconds.
* **Successful Checks**:  Number of consecutive health checks that must succeed before Vantage marks a down server as being back up.
* **Failed Checks**:  Number of consecutive health checks that must fail before Vantage marks an up server as being down. 

### DNS Specific Configuration

A DNS Monitor queries Name Servers for an A record and matches the resolved response against an expected IP address.

* **Request Name**:  Fully qualified resource record to be checked, such as www.avinetworks.com
* **Response Matches**:  
    * **Anything**:  Any DNS answer from the server will be successful, even an empty answer.
    * **Any Type**:  The DNS response must contain at least one non-empty answer.
    * **Query Type**:  The response must have at least one answer of which the resource record type matches the query type.
* **Response Code**:  
    * **Anything**:  The DNS server's response code, and any potential errors, are ignored and will not result in a health check failure.
    * **No Error**:  An error in the DNS response results in a health check fail.
* **Response String**:  The DNS response must contain this IP address to be considered successful. 