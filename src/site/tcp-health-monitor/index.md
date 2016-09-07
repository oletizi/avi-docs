---
title: TCP Health Monitor
layout: default
---
This article covers the specific configuration for this monitor type.  See the <a href="/overview-of-health-monitors">Overview of Health Monitors</a> article for general monitor information, implementation, and other monitor types.

For any TCP application, this monitor will wait for the TCP connection establishment, send the request string, and wait for the server to respond with the expected content. If no client request and server response are configured, the server will be marked 'up' from a successful TCP handshake completion.

### General Monitor Configuration

* **Send Interval**:  Frequency at which the health monitor initiates a server check, in seconds.
* **Receive Timeout**:  Maximum amount of time before the server must return a valid response to the health monitor, in seconds.
* **Successful Checks**:  Number of consecutive health checks that must succeed before Vantage marks a down server as being back up.
* **Failed Checks**:  Number of consecutive health checks that must fail before Vantage marks an up server as being down.

### TCP Specific Configuration

* **Client Request Data**:  Enter an appropriate send string applicable for the server application. This request will be sent to the server immediately after completing the TCP three-way handshake.
* **Server Response Data**:  Enter the expected response from the server. Vantage checks to see if the Server Response data is contained within the first 2KB of data returned from the server.
* **Health Monitor Port**: Specify a port that should be used for the health check. When this setting is blank, the default port configured for the server will be used. When it is specified, clients may be directed to a different port than what is monitored.
* **Half Open**:  When checked, the monitor sends a SYN.  Upon receipt of an ACK, the server is marked up and the Service Engine responds with a RST.  Since the TCP handshake is never fully completed, application health is not validated.  The purpose of this monitor option is for applications that do not gracefully handle quick termination.  By never completing the handshake, the application is not touched.  No application logs are generated or app resources wasted setting up the a connection from the health monitor.

### Server Maintenance Mode

This feature allows an application owner to gracefully bleed connections from a server prior to taking the server offline without the requirement to log into Avi Vantage to first place the server in disabled state.

See the <a href="/detecting-server-maintenance-mode-with-a-health-monitor/">Detecting Server Maintenance Mode</a> for an example configuration.

* **Maintenance Server Response Data**:  If the defined string is seen in the server response, place the server in maintenance mode.  During this time, health checks will continue, and servers operate the same as if manually disabled, which means existing client flows are allowed to continue, but new flows are sent to other available servers.  Once a server stops responding with the maintenance string, it will be noticed by the subsequent health monitors and will be brought online, being marked up or down as it normally would based on the server response data.  Note that a manually disabled server does not receive health checks and is not automatically re-enabled.