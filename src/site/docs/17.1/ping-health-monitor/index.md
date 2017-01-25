---
title: Ping Health Monitor
layout: default
---
This article covers the specific configuration for this monitor type.  See the <a href="/docs/16.3/overview-of-health-monitors">Overview of Health Monitors</a> article for general monitor information, implementation, and other monitor types.

Vantage Service Engines will send an ICMP ping to the server. This monitor type is generally very fast and lightweight for both Service Engines and the server; however, it’s not uncommon for ping to drop a packet and fail. It is important to ensure the Failed Checks field is set to at least 2. This monitor type does not test the health of the application, so it generally works best when applied in conjunction with an application specific monitor for the Pool.

Note:  It is possible for ICMP rate limiters to prevent Service Engines from aggressively health checking a server via ping.  This may be caused by an intermediate network firewall or rate limits set up on the server itself.

### General Monitor Configuration

* **Send Interval**:  Frequency at which the health monitor initiates a server check, in seconds.
* **Receive Timeout**:  Maximum amount of time before the server must return a valid response to the health monitor, in seconds.
* **Successful Checks**:  Number of consecutive health checks that must succeed before Vantage marks a down server as being back up.
* **Failed Checks**:  Number of consecutive health checks that must fail before Vantage marks an up server as being down. 