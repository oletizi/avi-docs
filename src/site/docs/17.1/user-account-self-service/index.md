---
title: User Account Self-Service
layout: layout171
---
When logged into the web interface, an Avi Vantage user can view or change information about their own account.

Note: This applies only to accounts in Vantage's <a href="{% vpath %}/user-accounts/">local user database</a>.

To manage your Vantage user account:
<ol> 
 <li>Log into the web interface, if not already logged in.</li> 
 <li>In the upper right corner of the display, click on your username and select My Account.</li> 
 <li>The settings that can be modified are listed below. When finished viewing or changing settings, click Save.</li> 
</ol> 

### Account Settings

Users can modify the following account information for their own user account:

* **Name:** Your full name.
* **Password:** To change your password, enter a new password in the New Password and Confirm New Password fields. (Passwords are case sensitive.)
* **Email:** Your email address. This is the address that Avi Vantage will use when you request a password recovery. 

### Display Settings

Users can modify the following display settings for their own user account:

* **Time:** Format for timestamps, such as those that appear in logs or analytics metrics. The format can be Universal Time Coordinated (UTC) or Local Time. In either case, Avi Vantage obtains the time from the specified NTP server.
* **Default Timeframe:** Select the time period over which to display information. See Display Time. (link)
* **Metric Value:** Change the view of pages such as the Analytics tab of the Virtual Services Details page, to show data points such as the End to End Timing chart as either an Average of the metrics data for the timeframe selected or the most Current data point. 

### Controller Settings

Users can modify the following Avi Controller setting for their own user account:

**Session Timeout:** Maximum number of minutes a management session can remain idle before being terminated by the Avi Controller. The timeout can be 0-999,999,999 minutes.
