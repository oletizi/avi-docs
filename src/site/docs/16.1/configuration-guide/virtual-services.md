---
layout: configuration-guide
title: Virtual Services
---

Virtual services are the core of the Vantage Vantage load-balancing and proxy functionality. A virtual service advertises an IP address and ports to the external world and listens for client traffic. When a virtual service receives traffic, it may be configured to:

*   Proxy the client's network connection.

*   Perform security, acceleration, load balancing and other tasks.

*   Forward the client's request data to the destination pool for load balancing.

A virtual service can be thought of as an IP address that Vantage is listening to, ready to receive requests. In a normal TCP/HTTP configuration, when a client connects to the virtual service address, Vantage will process the client connection or request against a list of settings, policies and profiles, then send valid client traffic to a back-end server that is listed as a member of the virtual service’s pool.

Typically, the connection between the client and Vantage is terminated or proxied at the SE, which opens a new TCP connection between itself and the server. The server will respond back directly to the Vantage IP address, not to the original client address. Vantage forwards the response to the client via the TCP connection between itself and the client.

[<img class="alignnone  wp-image-1084" src="img/architecture_1.jpg" alt="architecture_1" width="573" height="109" />][1]

A typical virtual service consists of a single IP address and service port that uses a single network protocol. Vantage allows a virtual service to listen to multiple service ports or network protocols.

For instance, a virtual service could be created for both service port 80 (HTTP) and 443 SSL (HTTPS). In this example, clients can connect to the site with a non-secure connection and later be redirected to the encrypted version of the site. This allows administrators to manage a single virtual service instead of two. Similarly, protocols such as DNS, RADIUS and Syslog can be accessed via both UDP and TCP protocols.

It is possible to create two unique virtual services, where one is listening on port 80 and the other is on port 443; however, they will have separate statistics, logs, and reporting. They will still be owned by the same Service Engines (SEs) because they share the same underlying virtual service IP address.

To send traffic to destination servers, the virtual service internally passes the traffic to the pool corresponding to that virtual service. A virtual service normally uses a single pool, though an advanced configuration using policies or DataScripts can perform content switching across multiple pools. A script also can be used in lieu of a pool, such as a virtual service that only performs an HTTP redirect.

A pool can only be assigned to a single virtual service. If the virtual service is deleted or pointed at a different pool, the pool will become unassigned and available to be used by a different virtual service.

When creating a virtual service, that virtual service listens to the client-facing network, which is most likely the upstream network where the default gateway exists. The pool connects to the server network.

Normally, the combined virtual service and pool are required before Vantage can place either object on an SE. When making an SE placement decision, Vantage must choose the SE that has the best reachability or network access to both client and server networks. Alternatively, both the clients and servers may be on the same IP network.

<a name="vs-page"></a>

### Virtual Service Page

Select Applications > Virtual Services to open the virtual services page. This page displays a list of the configured virtual services. It can be used to quickly check the status and view high level information for each.

This page includes the following functions:

<p style="padding-left: 30px">
  <a href="img/icon_search.png"><img class="size-full wp-image-1086 alignleft" src="img/icon_search.png" alt="icon_search" width="60" height="18" /></a>  <strong>Search:</strong> Search through the names of the objects.
</p>

<p style="padding-left: 30px">
  <span style="line-height: 1.42857"><a href="img/icon_new.png"><img class="size-full wp-image-1087 alignleft" src="img/icon_new.png" alt="icon_new" width="60" height="18" /></a>  <strong>Create:</strong> Opens the </span><em style="line-height: 1.42857">Create Virtual Service</em><span style="line-height: 1.42857"> popup.</span>
</p>

<p style="padding-left: 30px">
  <span style="line-height: 1.42857"><a href="img/icon_edit_white.png"><img class="size-full wp-image-1088 alignleft" src="img/icon_edit_white.png" alt="icon_edit_white" width="60" height="18" /></a>  <strong>Edit:</strong> Opens the </span><em style="line-height: 1.42857">Edit Virtual Service</em><span style="line-height: 1.42857"> popup.</span>
</p>

<p style="padding-left: 30px">
  <a href="img/icon_delete.png"><img class="size-full wp-image-1089 alignleft" src="img/icon_delete.png" alt="icon_delete" width="60" height="18" /></a>  <strong>Delete:</strong> Immediately removes a virtual service from Vantage. This will terminate all existing connections, delete the configuration of the virtual service, and place the pools used by that virtual service into an unused state. When deleting, a secondary prompt will ask to remove the pool at the same time or leave it intact. The SEs hosting the virtual service may be eligible for deletion if they are no longer in use. Note that an object cannot be un-deleted.
</p>

The table on this page contains the following information for each virtual service. The columns are customizable, so the exact view may be different.

<a href="img/vs-list-1.png" rel="attachment wp-att-5282"><img src="img/vs-list-1.png" alt="vs-list" width="880" height="324" class="alignnone size-full wp-image-5282" /></a>

*   <span style="line-height: 1.42857"><strong>Name:</strong>  Lists the name of each virtual service. Clicking the name of a virtual service opens the </span>Analytics<span style="line-height: 1.42857"> tab of the Virtual Service Details page.</span>
*   **Health:**  Provides both a number from 1-100 and a color-coded status to provide quick information about the health of each virtual service. If the virtual service is down, an exclamation point will appear instead of a number. A dash appears if the virtual service is disabled, not deployed, or in an error state.
    *   <span style="line-height: 1.42857">Hovering the cursor over this score opens the Health Score popup for the virtual service.</span>
    *   <span style="line-height: 1.42857">The View Insights link at the bottom of the popup opens the Insights tab of the Virtual Service Details page.</span>
    *   <span style="line-height: 1.42857">Clicking within the Health Score popup opens the Analytics tab of the Virtual Service Details page.</span>
*   <span style="line-height: 1.42857"><strong>Address:</strong> Displays the IP address advertised by the virtual service.</span>
*   <span style="line-height: 1.42857"><strong>Services:</strong> Lists the service ports configured for the virtual service. Ports that are configured for terminating SSL/TLS connections are denoted in parenthesis. A virtual service may have multiple ports configured. For example:</span>
    *   <span style="line-height: 1.42857">80 (HTTP)</span>
    *   <span style="line-height: 1.42857">443 (SSL)</span>
*   <span style="line-height: 1.42857"><strong>Pools:</strong> Lists the pools assigned to each virtual service. Clicking a pool name opens the Analytics tab of the Pool Details Page.</span>
*   <span style="line-height: 1.42857"><strong>Service Engines:</strong> Lists the Service Engines that the virtual server is assigned to. Clicking a Service Engine name opens the Analytics tab of the Service Engine Details page.</span>
*   **# Service Engines**:  Shows the number of SEs assigned to the virtual service as a time series. Useful to see if a virtual service scales up or down the number of SEs.
*   <span style="line-height: 1.42857"><strong>Throughput:</strong> Thumbnail chart of the throughput for each virtual service for the time frame selected.</span>
    *   <span style="line-height: 1.42857">Hovering the cursor over this graph shows the throughput for the highlighted time.</span>
    *   <span style="line-height: 1.42857">Clicking a graph opens the Analytics tab of the Virtual Service Details page for the virtual service.</span>

  <a name="detailspages"></a>

* * *

### Virtual Services Details Pages

* * *

The Virtual Service Details pages shows extensive information about a virtual service. Access these pages by clicking the name of a virtual service within the *Applications > Dashboard* or from the *Applications > Virtual Service* page.

The details pages are a loose collection of a number of sub-pages under the umbrella of the virtual service.

*   [Virtual Service Analytics Page][2]
*   [Virtual Service Logs Page][3]
*   [Virtual Service Health Page][4]
*   [Virtual Service Clients Page][5]
*   [Virtual Service Security Page][6]
*   [Virtual Service Events Page][7]
*   [Virtual Service Alerts Page][8]

 

#### Virtual Service Quick Info Popup

All of the virtual service details pages include the Virtual Service Quick Info popup, which may be accessed by hovering over or clicking the name of the virtual service in the top left corner of the page.

[<img class="alignnone  wp-image-1077" src="img/details_quick_info_vs_1.jpg" alt="details_quick_info_vs_1" width="472" height="281" />][9]

 The Virtual Service Quick Info popup provides buttons for the following functions:

*   **Edit:** Opens the Edit Virtual Service popup.
*   **Scale Out:** Scales out, which distributes connections for the virtual service to one additional SE per click, up to the maximum number of SEs defined in the SE group properties.
*   **Scale In:** Scales in the virtual service by one SE, down to a minimum of one SE.
*   **Migrate:** Moves the virtual service from the SE it is currently on to a different SE.

This popup also displays the following information (if applicable) for the virtual service:

*   **Service Engine:** Names of the SEs this virtual service is deployed on. Clicking on an SE name opens the Service Engine Details page for that SE.

*   **Uptime / Downtime:** The amount of time the virtual service has been in the current up or down state.

*   **Address:** IP address of the virtual service.

*   **Application Profile:** The application profile applied to the virtual service.

*   **Service Port:** Service ports on which the virtual service is listening for client traffic.

*   **TCP/UDP Profile:** The profile applied to the virtual service.

*   **Rules:** The number of policies or DataScripts attached to the virtual service.

*   **Non-Significant Logs:** When disabled, the virtual service defaults to logging significant events or errors. When enabled, all connections or requests are logged. (The Analytics page has additional logging options.)

*   **Real Time Metrics:** When this option is disabled, metrics are collected every five minutes, regardless of whether the Display Time is set to the Real Time. When the option is enabled, metrics are collected every 15 seconds.

*   **Client Log Filters:** Number of custom log filters applied to the virtual service. Log filters can selectively generate non-significant or more verbose logs.

*   **Client Insights:** Type of client insights gathered by the virtual service: Active, Passive, or None.

<a name="analytics"></a>

<a name="logs"></a>

 [1]: img/architecture_1.jpg
 [2]: virtual-service-analytics
 [3]: virtual-service-logs
 [4]: virtual-service-health-monitoring
 [5]: virtual-service-client-information
 [6]: virtual-service-security
 [7]: virtual-service-events-log
 [8]: virtual-service-alerts
 [9]: img/details_quick_info_vs_1.jpg