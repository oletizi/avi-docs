---
title: Client Log Levels
layout: 16.2
---
Client logs are viewable within the Logs tab of virtual service and pools, and provide a record of client interactions with the site.  Logs can be a very expensive task to collect and index, particularly taxing for the storage allocated to both Service Engines and Avi Controllers.  Because of this, Avi Vantage has many options for enabling different levels of logging for each virtual service.

### Significant Logs

Always enabled, Vantage records all Significant logs, which generally means errors.  The definition of an error is defined by the analytics profile attached to the virtual service.  Significant logs are collected by the Service Engines and immediately sent to the Controllers for indexing.

### Full Client Logs

In addition to Significant logs, Vantage may also capture 'good' network connection and HTTP traffic.  When a new virtual service is created, Full Client logs is enabled for the first 60 minutes.  After this time lapses, Full Client logs is deactivated and the virtual service drops back to only recording Signficant logs.  Full client logs capture all connections and HTTP request and responses.

These logs are collected and stored at the Service Engine.  When an admin requests to view virtual service or pool logs, the Controller pulls the logs from Service Engines, indexes and displays the results.  Because SEs typically have less storage capacity, these logs may rotate quickly depending on the allocated SE storage and the rate of new connections or requests.

### DataScript

If an error occurs within a DataScript, the results will be logged.  Expand a client log and select All Headers to view DataScript error details.

DataScripts may also be configured to log custom information.  When this is configured and activated for a connection or request (i.e., any prerequisite *if* condition is met), a Full Client log will be created for the connection or request, including the custom DataScript log value.  The Full Client log will be created even if Full Client logs is not active.  A common use case is to only provide detailed logs for connections that match specific criteria as determined by the DataScript.

### Policies

Policies may be used similar to DataScript to capture a Full Client log.  If the logging option is enabled and the policy match is true, a Full Client log for the connection or request is generated.  While policies can mark a connection or request to generate a Full Client log, policies cannot create custom log data like DataScripts.

### All Headers

Full Client logs include nearly 100 data points, including many that are not shown in the GUI.  To view all captured data, export the logs to view in a third party viewer.  By default, Full Client logs do not capture all client HTTP request and server response headers.  This expanded information may be captured by editing the Virtual Service > Analytics tab. First, ensure that Full Client logs is enabled.  Then create a custom log filter with the All Headers button enabled.  Best practice is to define a reasonably restrictive filter for the All Headers.  The request and response headers may be extremely large, sometimes exceeding 40 kB per log.  For this reason, enable this feature temporarily while troubleshooting, then disable it after.  To view the All Headers data, expand a client log and select the View All Headers button.
