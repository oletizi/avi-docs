<html>
 <head></head>
 <body>
  --- title: Example Custom Alert Notification layout: default --- 
  <a href="img/Alert-Workflow.png"><img src="img/Alert-Workflow.png" alt="Alert Workflow" width="404" height="78"></a>Avi Vantage defines&nbsp;a robust collection of events for which the default notification is an entry in the alert log. An administrator may wish to replace or augment the default behavior&nbsp;with one or more of the following additional actions: * Send an email * Send a Syslog event * Generate an SNMP trap * Execute a ControlScript for custom action This article&nbsp;steps through the UI screens required&nbsp;to configure a custom alert notification. &nbsp;See the 
  <a href="/docs/latest">Alerts Overview</a>&nbsp;for a broader explanation of the alert process. ### Step One:&nbsp;Alert Config Navigate to the Operations &gt; Alerts &gt; Alert Config page. &nbsp;This page shows a list of default alert configs, which are essentially the triggers that define when an alert should be generated. &nbsp;The default system alert configs may be edited, but not deleted. 
  <a href="img/AlertConfig1.png"><img src="img/AlertConfig1.png" alt="AlertConfig1" width="600" height="429"></a> &nbsp; From this page a new alert config may be created, or an existing one may be edited. For the sake of illustration, assume the existing Apic-Bad-Credentials alert config&nbsp;is to be customized. For this example,&nbsp;default alert action (System-Alert-Level-High) will&nbsp;be changed. &nbsp; ### Step Two: Alert Action As shown below, a blue-pencil edit icon appears at the extreme right of the Alert Config table. 
  <a href="img/AlertConfigTable-1.png"><img src="img/AlertConfigTable-1.png" alt="AlertConfigTable" width="600" height="76"></a> &nbsp; Clicking the edit icon reveals the Edit Alert Configuration panel. Clicking on the down-arrow in the Alert Action selection box reveals additional existing alert actions as well as the option to Create Alert Action: 
  <a href="img/AlertConfigEdit.png"><img src="img/AlertConfigEdit.png" alt="AlertConfigEdit" width="600" height="449"></a> &nbsp; Give&nbsp;the new alert action a descriptive name, as shown below: 
  <a href="img/AlertActionEdit.png"><img src="img/AlertActionEdit.png" alt="AlertActionEdit" width="600" height="587"></a> &nbsp; If you do not want Avi Vantage&nbsp;to make an entry in the alerts log when the event occurs, click the Only General External Alerts box. &nbsp;No alerts will be stored on Vantage or shown locally in the UI via the bell icon. 
  <a href="img/AlertPopup.png"><img src="img/AlertPopup.png" alt="AlertPopup" width="231" height="91"></a>Alert Level: Choose Low, Medium, or High. This is the word, color, and severity of the alert that is shown in the Vantage UI. Next, flesh out the details for&nbsp;as many&nbsp;of the four action options as are&nbsp;desired. For email, name the action and supply the To: and Cc: lists. &nbsp;For Vantage to successfully send emails, it may require additional system level configuration in the Administration &gt; System &gt; Email section of the UI. 
  <a href="img/Email.png"><img src="img/Email.png" alt="Email" width="600" height="260"></a> &nbsp; For syslog, choose a name. Then identify the syslog server(s). For each, specify the IP address or host name and select a port. 
  <a href="img/Syslog.png"><img src="img/Syslog.png" alt="Syslog" width="600" height="243"></a> &nbsp; For SNMP, choose a name. Then define by IP address (or hostname) and community all the SNMP trap servers that pertain. 
  <a href="img/SNMP-1.png"><img src="img/SNMP-1.png" alt="SNMP" width="600" height="243"></a> &nbsp; For ControlScript, either upload a text file with your Python code or enter it directly into the provided scrolling window.
  <a href="img/python-scropt.png"><img src="img/python-scropt.png" alt="python scropt" width="598" height="298"></a> The window size in the above screenshot is too small to show the entire ControlScript, which is as follows. It simply&nbsp;prints the parameters passed to the ControlScript. 
  <pre> #!/usr/bin/python
 import os
 import sys
 import json
 from avi.sdk.avi_api import ApiSession

 def ParseAviParams(argv):
 &nbsp; &nbsp; &nbsp;if len(argv) != 2:
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return
 &nbsp; &nbsp; &nbsp;alert_dict = json.loads(argv[1])
 &nbsp; &nbsp; &nbsp;print str(alert_dict)
 def DisableVirtualService(vs_name):
 &nbsp; &nbsp; # Get session on the basis of authentication token
 &nbsp; &nbsp; token=os.environ.get('API_TOKEN')
 &nbsp; &nbsp; user=os.environ.get('USER')
 &nbsp; &nbsp; tenant=os.environ.get('TENANT')
 &nbsp; &nbsp; with ApiSession("localhost", user, token=token, tenant=tenant) as session:
 &nbsp; &nbsp; &nbsp; &nbsp; # Get the virtualservice objct of name myVirtualService
 &nbsp; &nbsp; &nbsp; &nbsp; vs_obj = session.get_object_by_name('virtualservice', vs_name)
         # Update the object
 &nbsp; &nbsp; &nbsp; &nbsp; if vs_obj:
             vs_obj['enabled'] = False
&nbsp; &nbsp; &nbsp; &nbsp;  # Save the object
 &nbsp; &nbsp; &nbsp; &nbsp; session.put('virtualservice/%s' %vs_obj['uuid'], data=json.dumps(vs_obj))

 if __name__ == "__main__":
 &nbsp; &nbsp; ParseAviParams(sys.argv)
 &nbsp; &nbsp; DisableVirtualService('myVirtualService')</pre> ### Parameters Passed to ControlScript * Name: Name of the alert for which the ControlScript is invoked. * Level: Level of the alert for which the ControlScript is invoked (High, Medium, Low). * Object UUID: The Avi Vantage UUID of the object on which the alert is raised. * Object Name: Name of the Vantage object on which the alert is raised. * Threshold: The threshold value (if configured) for this alert. Can be a count or an absolute number. * Event Details: For alerts based on system events, the list of all events on which the alert is raised. The contents of the event details vary based on different events. * Metric Information: For metrics-based alerts, the list of all metrics on which the alert is raised * Throttle Count: A count of the number of times an alert was throttled ### Changing an Alert Action To&nbsp;make a change to any of the four alert actions, click into the box. A blue-pencil edit icon will appear as shown below.&nbsp;Click Save after you're content with your alert actions. 
  <a href="img/AlertAction.png"><img src="img/AlertAction.png" alt="AlertAction" width="600" height="262"></a> &nbsp; ### Step Three: Save the new alert action Prior to clicking Save in the below window, you may wish to add a description to document your work. 
  <a href="img/AlertConfiguration.png"><img src="img/AlertConfiguration.png" alt="AlertConfiguration" width="600" height="519"></a> &nbsp; ### Step Four: Confirm the custom action is in place Return to&nbsp;the Operations &gt; Alerts &gt; Alert Config page and expect to see your work reflected in the list of events and alert actions. 
  <a href="img/AlertConfigVerify.png"><img src="img/AlertConfigVerify.png" alt="AlertConfigVerify" width="600" height="188"></a> &nbsp;
 </body>
</html>