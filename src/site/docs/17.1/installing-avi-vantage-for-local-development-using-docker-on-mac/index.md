---
title: Installing Avi Vantage for Local Development Using Docker on Mac
layout: default
---
Local Avi Vantage development can be performed on an Apple Mac by loading the Avi executables into Docker containers.

### Prerequisites

* Mac hardware must be 2010 or newer
* MacOS 10.10.3 Yosemite or newer
* At least 10 GB of spare RAM capacity
* VirtualBox prior to version 4.3.30 must "NOT" be installed.
* The following local TCP ports should not be in use: 9443, 9080, 8443, 5098, 8053, 8054, 161.
* Avi Mini Version: 17.1 Build 5040 or later 

### Step1: Download and Install Docker on Mac

<code> https://docs.docker.com/docker-for-mac/<br> </code>
Click "Get Docker for Mac [stable] to download the Docker.dmg installation package.
Double-click <code>Docker.dmz</code>
Drag and drop the Docker icon into the Applications folder.

### Step2: Start Docker on Mac

Open Finder->Application
Double-click the Docker icon.
Once Docker is running on the Status bar, run "docker version" to verify the installed version with output akin to the below.

<code><br> Docker for Mac<br> Version: 1.12.5 (14777)</code>

macbookpro15:~ $ docker ps
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

macbookpro15:~ $ docker version
Client:
Version: 1.12.5
API version: 1.24
Go version: go1.6.4
Git commit: 7392c3b
Built: Fri Dec 16 06:14:34 2016
OS/Arch: darwin/amd64
Server:
Version: 1.12.5
API version: 1.24
Go version: go1.6.4
Git commit: 7392c3b
Built: Fri Dec 16 06:14:34 2016
OS/Arch: linux/amd64
macbookpro15:~ $

### Step3: Download the Avi Vantage on Mac package

Download <code>docker_install.tar.gz</code> from <code>https://www.avinetworks.com/portal/</code>

### Step4: Move install package to installation directory

Verify your Mac IP address using an <code>ifconfig -a</code> command. Search for and verify your IP address appears.

<code>scp docker_install.tar.gz</code> to your Mac at <code>/tmp</code> directory

### Step5: Untar and Unzip the install package

<code>tar zxvf docker_install-16.7.1.buildnumber.tar.gz<br> </code>

### Step6: Run the installation script

From the <code>/tmp</code> directory:
<code>macbookpro15:avi $ ./avi_mac_os.py -i ip.ipaddr.your.mac<br> </code>

Verify <code>docker ps</code> yields an output akin to the below.

<pre><code class="language-lua">macbookpro15:avi $ docker ps
CONTAINER ID  IMAGE                                                 COMMAND                  CREATED              STATUS         PORTS                     NAMES                                    
5612f8246172  avinetworks/se:17.1-5040-20170109.125818          "/opt/avi/scripts/doc"   About a minute ago   Up About a minute                           avise                                                                                                                                                                     
d08488db9dae  avinetworks/controller:17.1-5040-20170109.125818  "/opt/avi/scripts/doc"   About a minute ago   Up About a minute   0.0.0.0:161-&gt;161/tcp,   avicontroller
                                                                                                                                  0.0.0.0:5054-&gt;5054/tcp,
																																  0.0.0.0:5098-&gt;5098/tcp,
																																  0.0.0.0:8443-&gt;8443/tcp,
																																  0.0.0.0:9080-&gt;9080/tcp,
																																  0.0.0.0:9443-&gt;9443/tcp,
																																  0.0.0.0:8053-&gt;53/udp</code></pre>  

### Step7: Initialize the Avi Controller for the first time

Avi Controller GUI will be listening on HTTPS/9443 port.
Initialize Avi Controller via the browser by connecting to <code>https://ip.ipaddr.your.mac:9443</code>

Step8: Additional steps to enable unauthenticated SE-to-Controller communication:

Allow SE-to-Controller communication as follows:

<code><br> macbookpro15:avi $ docker exec -it avicontroller bash<br> /# shell<br> Login: admin<br> Password:<br> [admin:192-168-38-160]: &gt; configure controller properties<br> [admin:192-168-38-160]: controllerproperties&gt; allow_unauthenticated_nodes<br> Overwriting the previously entered value for allow_unauthenticated_nodes<br> [admin:192-168-38-160]: controllerproperties&gt; save<br> </code>

### Step:9 Verify your setup

Verify SE communication with OPER_UP

<code><br> show serviceengine<br> +---------------------------+---------------+------------------+---------------+------------+<br> | Name | SE Group | Mgmt IP | Cloud | Oper State |<br> +---------------------------+---------------+------------------+---------------+------------+<br> | 172.17.0.3 | Default-Group | 172.17.0.3 | Default-Cloud | OPER_UP |<br> +---------------------------+---------------+------------------+---------------+------------+<br> [admin:192-168-38-160]: &gt;<br> </code>
