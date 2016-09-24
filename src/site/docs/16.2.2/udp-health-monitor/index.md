---
title: UDP Health Monitor
layout: default
---
This article covers the specific configuration for this monitor type.  See the <a href="/docs/16.2.2/overview-of-health-monitors">Overview of Health Monitors</a> article for general monitor information, implementation, and other monitor types.

Send a UDP datagram to the server, then match the server’s response against the expected response data.

### General Monitor Configuration

* **Send Interval**:  Frequency at which the health monitor initiates a server check, in seconds.
* **Receive Timeout**:  Maximum amount of time before the server must return a valid response to the health monitor, in seconds.
* **Successful Checks**:  Number of consecutive health checks that must succeed before Vantage marks a down server as being back up.
* **Failed Checks**:  Number of consecutive health checks that must fail before Vantage marks an up server as being down. 

### UDP Specific Configuration

* **Client Request Data**:  Enter an appropriate send string applicable for the server application.
* **Server Response Data**:  Enter the expected response from the server. Vantage checks to see if the Server Response data is contained within the first 2KB of data returned from the server.
* **Health Monitor Port**:  Specify a port that should be used for the health check. When this setting is blank, the default port configured for the server will be used. When it is specified, clients may be directed to a different port than what is monitored. 

### Server Maintenance Mode

Custom server response can be used to mark a server as disabled.  During this time, health checks will continue, and servers operate the same as if manually disabled, which means existing client flows are allow to continue, but new flows are sent to other available servers.  Once a server stops responding with the maintenance string it will be brought online, being marked up or down as it normally would based on the server response data.

This feature allows an application owner to gracefully bleed connections from a server prior to taking the server offline without the requirement to log into Avi Vantage to first place the server in disabled state.

* **Maintenance Server Response Data**:  If the defined string is seen in the server response, place the server in maintenance mode. 