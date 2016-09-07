---
title: Email / SMTP Settings
layout: default
---
Avi Vantage may proactively send emails. This may be done for password reset operations, or to send defined alert actions to administrators or monitoring systems. Emails are sent from the Avi Controller, which means the Avi Controller will require <a href="/dns-ntp-settings">DNS </a>and network access to a destination email server.

The SMTP source is where the email will be sourced from when the Avi Controller is sending an email.

### View or Modify Email / SMTP Settings

1. Navigate to Administration > Settings > Email/SMTP.
1. To edit the settings, click on the edit icon.
1. Click Save when finished.

### Email / SMTP Settings

* 
**None:** When set to None, Avi Vantage will not send emails.
* 
**Local Host:** The Avi Controller will send the email from a local host. Some enterprise email servers may not accept this method.

* **From Address:** The email field that denotes who sent the email.
* 
**SMTP Server:** Avi Vantage can point to a remote SMTP server to use for sending emails. This method is generally more trusted by security conscious enterprise environments.

* 
**Username:** The username to authenticate to the mail server.
* 
**Password:** The password to authenticate to the mail server.
* 
**SMTP Server:** The mail server host.
* 
**Port Number:** The service port for SMTP, generally 25.
* 
**From Address:** The email field that denotes who sent the email.
* 
**Anonymous SMTP Server:** Like the SMTP Server option but without th eneed of a username and password to log into the SMTP server. (The SMTP server must allow anonymous access.)

* 
**From Address:** The email field that denotes who sent the email.
* 
**SMTP Server:** The mail server host.
* 
**SMTP Port:** The service port for SMTP, generally 25.