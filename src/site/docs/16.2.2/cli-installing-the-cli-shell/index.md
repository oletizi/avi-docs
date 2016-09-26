---
title: Installing the Avi Vantage CLI Shell
layout: default
---
Avi Vantage can be managed through the web interface, REST API, or command line interface (CLI). This article describes how to install the CLI shell onto a client PC.

## Overview

The CLI shell provides access to the Avi Controller through a PC client version of the Controller’s CLI. Two versions of the CLI shell installation package are available:

* **avi_shell**-16.1.5000.tar.gz (or later): Can be used with all infrastructure types. If installing this version of the CLI shell, continue with this article. 
* **avi_lbaas**-16.1.9014.tar.gz (or later): Can be used if the infrastructure type is OpenStack, and Keystone support is enabled. (This is an option during initial Avi Controller setup and also can be configured later.) To install this version of the CLI shell, <a href="/docs/latest/installing-the-lbaas-driver-cli-shell-openstack">go here</a> instead. 

### Requirements to enable remote CLI shell

* CLI Shell server listens on TCP port 5054. In order to use the remote CLI shell, port 5054 must be permitted in the firewall rules between the CLI client and the Avi Controller.  

### OS Versions Supported

Versions of the CLI shell are available for Linux and Mac.

* Linux Ubuntu Docker container
* Linux (not in a Docker container)
* Mac 

The steps are the same for each OS.

### Prerequisites

The Vantage CLI shell requires the following software:

* pip (install package manager for Python).
* Virtual environment (virtualenv): command syntax included below.
* Avi Vantage CLI shell installation file: from AWS S3. 

The following sections provide steps for installing the Vantage CLI shell.

<a name="docker-prep"></a>

## Installing the CLI Shell on a Ubuntu Docker Container

To install the Vantage CLI shell on a Ubuntu Docker container, download the shell package onto the host, then enter the following commands. Make sure to edit the "/tmp" in "/tmp ubuntu" to the directory where you downloaded the image.


<pre class="command-line language-bash" data-prompt=": >"><code>docker run -it -v /tmp:/tmp ubuntu
sudo apt-get update
sudo apt-get install python-pip</code></pre> <a name="shell-install"></a> 

## Installing the CLI Shell on Linux or Mac

This section provides steps for installing the Vantage CLI shell onto the Linux or Macintosh. The steps are the same for either OS.
&gt; Note: If installing a CLI shell to manage an OpenStack write access mode deployment with Keystone support enabled, <a href="/docs/latest/installing-the-lbaas-driver-cli-shell-openstack">go here</a> instead.
 <ol> 
 <li>Install pip, if not already installed.</li> 
 <li>Install virtualenv, if not already installed:<br> <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>sudo pip install virtualenv
  Downloading virtualenv-14.0.6-py2.py3-none-any.whl (1.8MB)
    100% |████████████████████████████████| 1.8MB 178kB/s
Installing collected packages: virtualenv
Successfully installed virtualenv-14.0.6</code></pre></li> 
 <li>Create a virtual environment for the CLI shell:<br> <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>virtualenv avi_shell
New python executable in /home/user/git/clean/avi-dev/build/avi_shell/bin/python
Installing setuptools, pip, wheel...done.</code></pre></li> 
 <li>Go to the CLI shell virtual environment:<br> <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>cd avi_shell/
source ./bin/activate</code></pre></li> 
 <li>Install the CLI shell package: <pre crayon="false" class="command-line language-bash"><code>pip install /tmp/avi_shell-16.1.5000.tar.gz
Processing /tmp/avi_shell-16.1.5000.tar.gz
Collecting cmd2==0.6.8 (from shell-client==16.1)
Collecting iso8601==0.1.11 (from shell-client==16.1)
  Using cached iso8601-0.1.11-py2.py3-none-any.whl
...
...
Successfully installed cmd2-0.6.8 commentjson-0.6 iso8601-0.1.11 prettytable-0.7.2 pyparsing-2.1.0 pytz-2015.7 requests-2.9.1 requests-toolbelt-0.5.1 shell-client-16.1 urllib3-1.14 virtualenv-13.1.2 wheel-0.26.0 wrapt-1.10.6
</code></pre> </li> 
</ol> 

## Logging Onto the CLI Shell

To log onto the Avi Vantage CLI shell:

<pre class="command-line language-bash"><code>avi_shell --address 10.10.10.99
Login: admin
Password *****
  
</code></pre> 

The *IPADDR* is the IP address of the Controller (10.10.10.99 in the example).

After login, Vantage CLI commands can be entered into the shell. The command in the following example displays the Vantage version:

<pre class="command-line language-bash"><code>: &gt; show version controller
+-----------------+------------------------------------+
| Controller Name | Version                            |
+-----------------+------------------------------------+
| 10.10.25.44     | 16.1(5000) 2016-03-03 22:42:48 UTC |
+-----------------+------------------------------------+
: &gt;

</code></pre> 

<a name="shell-install-lbaas"></a>

## Leaving the CLI Virtual Environment

To exit the CLI shell virtual environment:


<pre class="command-line language-bash" data-prompt=": >"><code>deactivate</code></pre>  

## Restarting the CLI Shell

After the CLI shell is installed, just enter the following command to start it the next time:


<pre class="command-line language-bash" data-prompt=": >"><code>avi_shell/bin/avi_shell 

: &gt; show version controller
+-----------------+------------------------------------+
| Controller Name | Version                            |
+-----------------+------------------------------------+
| node-1          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-2          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-3          | 16.2(5000) 2016-03-07 16:45:38 UTC |
+-----------------+------------------------------------+</code></pre> 