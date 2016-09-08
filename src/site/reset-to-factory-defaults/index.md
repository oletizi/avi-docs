---
title: CLI&#58; Reset to Factory Defaults
layout: default
---
In some scenarios, it may be useful to reset Avi Vantage to its factory default settings. With a few exceptions, this will wipe out all configuration information and is equivalent to completely reinstalling a fresh deployment.

As part of the factory reset, the Controllers and Service Engines (SEs) will reboot and delete their load balancing and proxy configurations, while still maintaining their basic networking configurations.

Following a factory reset, the next time a Vantage user logs onto the Controller through the web interface, the initial setup wizard starts. The Vantage user can then enter new configuration settings, including a new password.

To reset to factory defaults, run the following command from the CLI:
<pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>reboot clean</code></pre>

Note: Upon reboot clean, a new self-signed certificate is generated for the portal. If you are logged in the UI, the browser may not redirect the page to login as it sees a certificate change. You will have to refresh the page in the browser to get back to login page.

### What This Command Removes

* SEs and Controllers
* SE and Controller management networking properties such as IPs and default gateways
* Licenses

Note: In write access mode deployments, if an SE is not given a new configuration within a configured interval, it is deleted. (In the web interface, this interval is configurable on the Advanced tab for the SE group, in the Delete Unused SEs After field.)

### What This Command *Does Not* Remove

* Virtual service configurations
* Pool configurations
* SSL certificates, including certificates that may have been used for the Controller web interface
* Backups of the configuration
* Logs and metrics
* RBAC, users, passwords