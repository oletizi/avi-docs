---
title: Installing the LBaaS CLI Shell (OpenStack with Keystone)
layout: layout163
---
The CLI shell provides access to the Avi Controller through a PC client version of the Controller’s CLI. Two versions of the CLI shell installation package are available:

* **avi_shell**-16.1.5000.tar.gz (or later): Can be used with all infrastructure types. If installing this version of the CLI shell, <a href="/docs/16.3/cli-installing-the-cli-shell">go here</a> instead. 
* **avi_lbaas**-16.1.9014.tar.gz (or later): Can be used if the infrastructure type is OpenStack, and Keystone support is enabled. (This is an option during initial Avi Controller setup and also can be configured later.) To install this version of the CLI shell, continue with this article. 

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

Additionally, the LBaaS version of the CLI shell is applicable if the Avi Controller is deployed into an OpenStack cloud and Keystone support is enabled. A Keystone catalog entry such as the following is required:

<pre><code class="language-lua">source admincc
keystone catalog
Service: avi-lbaas
+-----------+----------------------------------+
|  Property |              Value               |
+-----------+----------------------------------+
|     id    | db5e92e8740c4850ba3d81c73b6c4f23 |
| publicURL |     https://10.10.25.201/api     |
|   region  |            regionOne             |
+-----------+----------------------------------+
...
...</code></pre>  

If the Keystone catalog does not contain an entry for Avi Vantage, one will need to be added using the steps in the following section.

## Adding a Keystone Catalog Entry for Avi Vantage

Adding a Keystone entry requires an administrator. 

This section provides the command strings the administrator can use to create the Keystone entry for Avi Vantage. The command strings differ slightly depending on whether they are entered using **openstack** client or **keystone** client. 

Make sure to replace the following with the values that are applicable to your deployment:

* Avi-Controller-IP: Management IP address of the Avi Controller.
* RegionOne: Name of the region the Avi Controller is allowed to use. If there is only one region, enter **keystone catalog** and select the region name that is used for other services. 

### If Using **openstack-client**

Depending on the version of open-stack client, use one or the other set of commands shown here. If the openrc credentials contain "OS_IDENTITY_API_VERSION=3," use the second set of commands. Otherwise, use the first set of commands.

**If openrc credentials *do not* contain "OS_IDENTITY_API_VERSION=3":**


<pre><code class="language-lua">openstack service create  --name avi --description "Avi LBaaS" avi-lbaas
openstack endpoint create --publicurl https://<em>AviControllerIP</em>/api --region RegionOne avi-lbaas</code></pre>  

**If openrc credentials contain "OS_IDENTITY_API_VERSION=3":**


<pre><code class="language-lua">openstack service create  --name avi --description "Avi LBaaS" avi-lbaas
openstack endpoint create --region RegionOne avi-lbaas public https://AviControllerIP/api</code></pre>  

### If Using **keystone-client**

<pre><code class="language-lua">keystone service-create --name avi --type avi-lbaas --description "Avi LBaaS"
keystone endpoint-create --service-id $(keystone service-list | awk '/ avi-lbaas / {print $2}') --publicurl https://<em>AviControllerIP</em>/api --region RegionOne</code></pre>   

## Installing the LBaaS CLI Shell

<ol> 
 <li>Download the LBaaS shell client package:avi_lbaas-16.1.9014.tar.gz</li> 
</ol> <ol start="2"> 
 <li>Create a virtual environment for the CLI shell:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">virtualenv .avi_lbaas
New python executable in .avi_lbaas/bin/python
Installing setuptools, pip, wheel...done.</code></pre> 
  <!-- [Format Time: 0.0016 seconds] --> </li> 
</ol> <ol start="3"> 
 <li>Activate the virtual environment:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">source .avi_lbaas/bin/activate</code></pre> 
  <!-- [Format Time: 0.0007 seconds] --> </li> 
</ol> <ol start="4"> 
 <li>Install the downloaded package:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">pip install ./avi_lbaas-16.1.9014.tar.gz 
Processing ./avi_lbaas-16.1.9014.tar.gz
Collecting Babel==2.1.1 (from shell-client-lbaas==16.1)
  Using cached Babel-2.1.1-py2.py3-none-any.whl
Collecting cmd2==0.6.8 (from shell-client-lbaas==16.1)
Collecting debtcollector==1.1.0 (from shell-client-lbaas==16.1)
  Using cached debtcollector-1.1.0-py2.py3-none-any.whl
...
...
Building wheels for collected packages: shell-client-lbaas
  Running setup.py bdist_wheel for shell-client-lbaas
  Stored in directory: /Users/user/Library/Caches/pip/wheels/7e/00/01/ce4f12b9b00cc413c6a1a7400a95532bfa7279e99e40b37221
Successfully built shell-client-lbaas
Installing collected packages: pytz, Babel, pyparsing, cmd2, pbr, wrapt, six, debtcollector, funcsigs, iso8601, monotonic, msgpack-python, netaddr, netifaces, argparse, stevedore, oslo.config, oslo.i18n, oslo.utils, oslo.serialization, prettytable, requests, python-keystoneclient, requests-toolbelt, urllib3, virtualenv, wheel, commentjson, shell-client-lbaas
  Found existing installation: wheel 0.24.0
    Uninstalling wheel-0.24.0:
      Successfully uninstalled wheel-0.24.0
Successfully installed Babel-2.1.1 argparse-1.4.0 cmd2-0.6.8 commentjson-0.6 debtcollector-1.1.0 funcsigs-0.4 iso8601-0.1.11 monotonic-0.5 msgpack-python-0.4.6 netaddr-0.7.18 netifaces-0.10.4 oslo.config-3.2.0 oslo.i18n-3.1.0 oslo.serialization-2.2.0 oslo.utils-3.3.0 pbr-1.8.1 prettytable-0.7.2 pyparsing-2.1.0 python-keystoneclient-1.8.1 pytz-2015.7 requests-2.9.1 requests-toolbelt-0.5.1 shell-client-lbaas-16.1 six-1.10.0 stevedore-1.10.0 urllib3-1.14 virtualenv-13.1.2 wheel-0.26.0 wrapt-1.10.6</code></pre> 
  <!-- [Format Time: 0.0179 seconds] --> </li> 
</ol> <ol start="5"> 
 <li>Source your keystone credentials or set the environment variables explicitly.<br> To source them:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">source admincc
keystone catalog
...
...
Service: avi-lbaas
+-----------+----------------------------------+
|  Property |              Value               |
+-----------+----------------------------------+
|     id    | db5e92e8740c4850ba3d81c73b6c4f23 |
| publicURL |     https://10.10.25.201/api     |
|   region  |            regionOne             |
+-----------+----------------------------------+
...
...</code></pre> 
  <!-- [Format Time: 0.0085 seconds] --> Or, to instead set the environment variables explicitly:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">export OS_USERNAME=admin
export OS_AUTH_URL=http://10.10.16.82:5000/v2.0
export OS_PASSWORD=avi123
export OS_TENANT_NAME=admin</code></pre> 
  <!-- [Format Time: 0.0011 seconds] --> </li> 
</ol> <ol start="6"> 
 <li>Invoke avi_lbaas for CLI access to Avi Controller:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi_lbaas</code></pre> 
  <!-- [Format Time: 0.0004 seconds] --> The Avi Vantage CLI shell prompt appears: &gt;<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; show version controller
+-----------------+------------------------------------+
| Controller Name | Version                            |
+-----------------+------------------------------------+
| node-1          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-2          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-3          | 16.2(5000) 2016-03-07 16:45:38 UTC |
+-----------------+------------------------------------+</code></pre> 
  <!-- [Format Time: 0.0088 seconds] --> </li> 
</ol> <ol start="7"> 
 <li>Type <strong>exit</strong> at the CLI prompt to exit:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; exit</code></pre> 
  <!-- [Format Time: 0.0006 seconds] --> </li> 
</ol>  

## Leaving the LBaaS CLI Virtual Environment

To exit the LBaaS virtual environment, deactivate:


<pre><code class="language-lua">deactivate</code></pre>   

## Starting the LBaaS CLI Shell

After the LBaaS CLI shell is installed, just enter the following command to start it the next time:


<pre><code class="language-lua">.avi_lbaas/bin/avi_lbaas 

: &gt; show version controller 
+-----------------+------------------------------------+
| Controller Name | Version                            |
+-----------------+------------------------------------+
| node-1          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-2          | 16.2(5000) 2016-03-07 16:45:38 UTC |
| node-3          | 16.2(5000) 2016-03-07 16:45:38 UTC |
+-----------------+------------------------------------+</code></pre>  