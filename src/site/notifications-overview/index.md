<html>
 <head></head>
 <body>
  --- title: Notifications Overview layout: default --- Avi Vantage aggressively monitors system health, which is tracked via&nbsp;events or metrics.&nbsp;Over 500 data points for the system and virtual services are analyzed continually by alert configurations, which create alerts. These alerts may be used for a number of purposes such as system automation.&nbsp;An important action for a newly generated alert is to notify an administrator of the issue.&nbsp;All notifications to external systems are sent from one or more of the Avi&nbsp;Controllers, not from the Avi Service Engines. 
  <img src="img/Alert-Workflow.png" alt="Alert Workflow" width="476" height="92"> Notifications may take the form of: * Local notifications * Email * Syslog * SNMP&nbsp;traps See the 
  <a href="/docs/latest">Alerts Overview</a> for a broader view of how the alerts and notification system intersect. Refer to
  <a href="/docs/architectural-overview/operations/notifications/"> this article</a>&nbsp;to learn how to configure notifications via the UI. ### Local Notifications 
  <a href="img/AlertPopup.png"><img src="img/AlertPopup.png" alt="AlertPopup" width="241" height="95"></a>Alerts are logged&nbsp;and made visible on the Operations &gt; Alerts &gt; All Alerts page, which displays&nbsp;all current alerts across the system. Alert lists on&nbsp;UI pages focusing on&nbsp;Service Engines, virtual services, and pools show&nbsp;only the&nbsp;alerts relevant to the&nbsp;particular object. 
  <a href="img/AlertConfigNew-1.png"><img src="img/AlertConfigNew-1.png" alt="AlertConfigNew" width="171" height="223"></a>Local notifications are marked by the alert action with an alert priority, which provides an informative mechanism for categorizing the alerts.&nbsp;While high severity alerts are more important medium or low alerts, there is no functional difference between them as far as the notifications are concerned.&nbsp;The color in the GUI will reflect the severity only. The alert actions object determines which types of notifications will be generated for a new alert.&nbsp; This object does not explicitly call out notifications logged to Vantage's internal&nbsp;database, though it does have an option to disable them via the *Only Generate External Alerts* checkbox. ### Syslog Notifications Syslog messages may be sent to one or more syslog servers.&nbsp;Communication is via TCP, using a customizable port. Most syslog servers listening to non-encrypted TCP default to port 601. Configuring syslog notifications pushes alerts to syslog servers. It does not export Vantage's virtual service logs.&nbsp;These may be pulled from an external logging system via the API, or may be scripted to push from the Avi Controller to a remote log system. ### Email Notifications Alert Actions may be configured to send alerts to administrators via email.These emails could be sent directly to administrators or to reporting systems that accept email. Either option requires the Avi&nbsp;Controller to have a valid DNS configured and a default gateway or route configured so it can resolve the destination mail server and properly forward the messages. Information regarding the SMTP server and the sender must be configured in the Administration &gt; Settings &gt; Email/SMTP page before email notifications can be sent. ### SNMP Trap Notifications Alerts may be sent via SNMP traps using SNMP v2c.&nbsp;Multiple trap servers may be defined. Configuring SNMP traps is exclusively for sending alerts to an SNMP trap server, not for configuring how SNMP would poll Vantage SNMP OIDs. Traps are sent from the Controller cluster leader, but the leadership role can move to either follower Controller after a failure. Consequently, the external SNMP server should be configured to allow traffic from any one of the three Controllers in the cluster, i.e., all three addresses should be in the SNMP server's allowed-access list.&nbsp;The firewall rules should be configured to allow UDP traffic destined to port 162 on the SNMP trap server from any of the three cluster member's IP addresses. &nbsp;
 </body>
</html>