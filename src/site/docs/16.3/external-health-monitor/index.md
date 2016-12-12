---
title: External Health Monitor
layout: default
---
This article covers the specific configuration for this monitor type.  See the <a href="/docs/16.2.2/overview-of-health-monitors">Overview of Health Monitors</a> article for general monitor information, implementation, and other monitor types.

The external monitor type allows scripts to be written to provide highly customized and granular health checks. The scripts may be Linux shell, Python, or Perl, which can be used to execute wget, netcat, curl, snmpget, mysql-client, or dig. External monitors have constrained access to resources, such as CPU and memory, so as to not affect normal functioning of Vantage Service Engines. As with any custom scripting, thoroughly validate the long term stability of the implemented script before pointing it at production servers.

Errors generated from the script may be viewed in the output of the Operations &gt; Events log.

Avi Vantage includes three sample scripts via the System-Xternal Perl, Python and Shell monitors.

### General Monitor Configuration

* **Send Interval**:  Frequency at which the health monitor initiates a server check, in seconds.  
    * Best practice**:**  For busy Service Engines, keep the monitoring interval lower and receive timeout larger, since external checks tend to use more system resources than the system default monitors.
* **Receive Timeout**:  Maximum amount of time before the server must return a valid response to the health monitor, in seconds.
* **Successful Checks**:  Number of consecutive health checks that must succeed before Vantage marks a down server as being back up.
* **Failed Checks**:  Number of consecutive health checks that must fail before Vantage marks an up server as being down. 

### External Specific Configuration

As best practice, be sure to clean up any temporary files that are created by scripts.

When building an external monitor, it is common to manually test the successful execution of the commands.  To test a command from an SE, it may be necessary to switch to the proper namespace or tenant.  The production external monitor will correctly use the proper tenant.  To manually switch tenants when testing a command from the SE CLI, follow the commands in the following KB:  <a href="/manually-validate-server-health/">Manually Validate Server Health</a>.

* **Script Code**:  Upload the script via copy/paste or uploading the file.
* **Script Parameters**:  Enter any optional arguments to apply. These strings are passed in as arguments to the script, such as $1 = server IP, $2 = server port.
* **Script Variables**:  Custom environment variables may be fed into the script to allow for simplified re-usability. For example, a script that authenticates to the server may have a variable set to USER=test. 

**Script Success**:  If a script exits with any data it is considered a success and marks a server up.  If there is no data from the script the monitor will mark the server down.  In the Sharepoint monitor example below, the script includes a:  | grep "200 OK".  If this is found, this data is returned and the monitor exists as a success.  If the grep does not find this string, no data is returned and the monitor marks the server down.

 

*MySQL example script:*


<pre><code class="language-lua">#!/bin/bash
#mysql --host=$IP --user=root --password=s3cret! -e "select 1"</code></pre>  *Sharepoint example script:* 

<pre><code class="language-lua">#!/bin/bash
#curl http://$IP:$PORT/Shared%20Documents/10m.dat -I -L --ntlm -u $USER:$PASS -I -L &gt; /run/hmuser/$HM_NAME.out 2&gt;/dev/null
curl http://$IP:$PORT/Shared%20Documents/10m.dat -I -L --ntlm -u $USER:$PASS -I -L | grep "200 OK"</code></pre>  *Sharepoint script variables:* 

<pre><code class="language-lua">USER='foo\administrator' PASS=foo123</code></pre>  