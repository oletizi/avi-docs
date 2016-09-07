---
title: Disabling Back-end Servers for Maintenance
layout: default
---
Avi Vantage provides a way to actively disable back-end servers for maintenance.

When a server is disabled for maintenance, Vantage marks the server Disabled. Existing sessions are terminated immediately or allowed to end gracefully, either with a maximum timeout or with no timeout.

* Disable with immediate effect: All client sessions are immediately terminated.
* Gracefully disable with a finite timeout: No new sessions are sent to the server. Existing sessions are allowed to terminate on their own, up to the specified timeout. Once the timeout is reached, any remaining sessions are immediately terminated.
* Gracefully disable with infinite timeout: No new sessions are sent to the server. All existing sessions are allowed to terminate on their own.

Servers can be disabled from within the pool configuration that contains the servers.

To disable a server for maintenance:

1. Navigate to Dashboard > Pools.
1. Click on the pool name.
1. Click Servers.
1. Click the checkbox next to the name of each server to disable .
1. Click the Disable or Gracefully button:

* To immediately terminate all sessions on the servers and shut them down, click Disable.
* To gracefully shut down the sessions, click Gracefully:

* Until all flows drain: All sessions are allowed to terminate naturally.
* After *number* minutes: Specifies the maximum amount of time to allow any existing sessions to continue before terminating them.

<a href="img/Screen-Shot-2016-07-07-at-5.24.43-PM.png"><img src="img/Screen-Shot-2016-07-07-at-5.24.43-PM.png" alt="Screen Shot 2016-07-07 at 5.24.43 PM" width="309" height="179"></a>

<a href="img/Screen-Shot-2016-07-07-at-5.24.59-PM.png"><img src="img/Screen-Shot-2016-07-07-at-5.24.59-PM.png" alt="Screen Shot 2016-07-07 at 5.24.59 PM" width="391" height="175"></a>

Note: Vantage also can be configured to use information in the health-check responses from servers to detect when a server is in maintenance mode. For information, <a href="/detecting-server-maintenance-mode-with-a-health-monitor/">click here</a>.