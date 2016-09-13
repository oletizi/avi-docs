---
title: Installing Avi Vantage for Cisco CSP-2100
layout: default
---
This article provides the steps for installing Avi Vantage on Cisco's CSP-2100.  Vantage may be deployed on CSP-2100 in either no orchestrator mode or Linux server cloud mode.  This article covers both. For documentation on installing Avi Vantage on Linux servers using non-CSP-2100 hardware, <a href="/installing-avi-vantage-for-a-linux-server-cloud/">click here</a> instead.

## Topology

The topology shown below consists of an Avi Controller and some Avi Service Engines (SEs) installed in a Linux server cloud and connected to the back-end server pool by a CSP-2100 router. To leverage the DPDK capabilities of the physical NICs, the SEs are connected to the enp7s0fx pNICs of the CSP-2100 in passthrough (pcie) mode.

<a href="img/Installing-AVI-Vantage-for-CSP-2100-1.png"><img src="img/Installing-AVI-Vantage-for-CSP-2100-1.png" alt="Installing AVI Vantage for CSP-2100" width="800" height="600"></a>

## Networking Interfaces for CSP-2100

The following table shows the names of physical interfaces (pNICs) on the CSP-2100, along with their supported speeds.
<table class="table"> 
 <tbody> 
  <tr> 
   <th>Name</th> 
   <th width="50%">Speed</th> 
  </tr> 
  <tr> 
   <td>enp1s0f0</td> 
   <td>1 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp1s0f1</td> 
   <td>1 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp4s0f0</td> 
   <td>1 Gbp</td> 
  </tr> 
  <tr> 
   <td>enp4s0f1</td> 
   <td>1 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp4s0f2</td> 
   <td>1 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp4s0f3</td> 
   <td>1 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp7s0f0</td> 
   <td>10 Gbps</td> 
  </tr> 
  <tr> 
   <td>enp7s0f1</td> 
   <td>10 Gbps</td> 
  </tr> 
 </tbody> 
</table>

 

The pNIC named enp1s0f0 can be connected to the management network. This provides access to the CSP dashboard. The 10-Gbps interfaces (enp7s0f0 and enp7s0f1) can be used as data NICs and must be connected to the corresponding data VLANs.

## Deploying the Avi Controller

### Upload the Avi Controller Image

1.  Log on to the CSP dashboard using a browser.
1.  Navigate to Configuration > Repository.
<a href="img/linux-server-cloud-csp2100.png"><img src="img/linux-server-cloud-csp2100.png" alt="linux-server-cloud-csp2100" width="938" height="372"></a>
1. Click on Select, and browse to and select the Avi Controller qcow2 image obtained from the <a href="/access-to-avi-portal/">avinetworks.com/portal</a> site.
1. Click Upload.

### Deploy the Avi Controller

This section describes how to deploy Avi Controller using both the CSP UI and the REST API.

### Deploy Using CSP UI

Use the following steps to deploy the Avi Controller using the CSP UI:

1. Navigate to Configuration > Services.
<a href="img/linux-server-cloud-csp2100-2.png"><img src="img/linux-server-cloud-csp2100-2.png" alt="linux-server-cloud-csp2100-2" width="938" height="345"></a>
1. Click on Create.
1. Enter “Controller” in the Service Name field and press enter.
1. Click on Target Host Name and select the host from the list.
1. Click on Image Name and select the controller.qcow2 image from the list.
1. Click on vNIC > vNIC1 > External Network > enp1s0f0.
<a href="img/linux-server-cloud-csp2100-3.png"><img src="img/linux-server-cloud-csp2100-3.png" alt="linux-server-cloud-csp2100-3" width="915" height="489"></a>Note: If the management network is on a different VLAN, specify the VLAN number in the VLAN field, and click on VLAN Tagged to enable tagging.
1. Click on Resource Config and set the resource allocations. The minimum requirement is 4 cores, 12 GB of memory, and 64 GB of disk.
1. *(optional)*Click on VNC Password and specify a password for console login using VNC.
1. Click on Deploy.

### Deploy Using REST API

CSP uses basic authentication for the REST API. Use the following **curl** command to create the Controller service:
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>

### Controller IP Address

Use the steps in either of the following sections to assign a management IP address to the Avi Controller.

### DHCP Addressing

If DHCP is enabled on the management network, the Avi Controller should get an IP address upon power up. After the Avi Controller is deployed, log in to the console to get the IP address of the Avi Controller:

1. Click on the VNC icon to launch the console.
<a href="img/linux-server-cloud-csp2100-4.png"><img src="img/linux-server-cloud-csp2100-4.png" alt="linux-server-cloud-csp2100-4" width="921" height="323"></a>
1. Wait for the Avi Controller to completely boot up and present the login prompt.
1. Log in using the default credentials (admin/admin).
1. Run the **ifconfig** command to find the IP address for eth0.

### Static Addressing

If DHCP is not configured on the management network, configure a static IP address for the Avi Controller:

1. From the console, log in using the default credentials (admin/admin).
1. Edit the /etc/network/interfaces file to read as shown below. (Make sure to use the IP addresses that apply to your deployment. These addresses are only an example.)
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>
1. Save and exit.
1. Reboot the Avi Controller.

## Initial Setup of Avi Controller for No Orchestrator

Use a browser to navigate to the Avi Controller IP address, and follow the below steps to perform initial setup:

1. Configure the Administrator account and click on Create Account.<a href="img/Screen-Shot-2016-08-05-at-4.23.39-PM.png"><img src="img/Screen-Shot-2016-08-05-at-4.23.39-PM.png" alt="Screen Shot 2016-08-05 at 4.23.39 PM" width="236" height="305"></a>
1. Configure the DNS and NTP settings and click "Next."<a href="img/Screen-Shot-2016-08-05-at-4.29.04-PM.png"><img src="img/Screen-Shot-2016-08-05-at-4.29.04-PM.png" alt="Screen Shot 2016-08-05 at 4.29.04 PM" width="236" height="277"></a>
1. Select "No Orchestrator" for the cloud type and click "Next."<a href="img/Screen-Shot-2016-08-05-at-4.30.37-PM.png"><img src="img/Screen-Shot-2016-08-05-at-4.30.37-PM.png" alt="Screen Shot 2016-08-05 at 4.30.37 PM" width="236" height="303"></a>
1. Download the SE qcow2 image from the Controller. Vantage will spin up Avi SEs using this image. Note: To establish the correct parent-child relationship that Controllers and their SEs have, an Avi SE must be spun up using the SE qcow2 image downloaded from the particular Avi Controller to which it is to connect.<a href="img/Screen-Shot-2016-08-05-at-4.34.11-PM.png"><img src="img/Screen-Shot-2016-08-05-at-4.34.11-PM.png" alt="Screen Shot 2016-08-05 at 4.34.11 PM" width="310" height="237"></a>
1. To create an Avi SE on Cisco CSP, we need to configure a ‘day0’ yml file. Day0 files are used to insert configuration data into the Avi SE. That data includes details such as the SE management IP, Controller IP, token the SE uses to authenticate with the Avi Controller, etc.
5a. Generate a token for the SE from the Avi Controller by navigating to Infrastructure > Clouds and clicking on the ‘key’ icon. Note : A token needs to be generated*per Avi SE*. Since the token expires one hour from the time it is generated, an Avi SE needs to be created within 1 hour of token generation.
<a href="img/Screen-Shot-2016-08-05-at-4.48.43-PM.png"><img src="img/Screen-Shot-2016-08-05-at-4.48.43-PM.png" alt="Screen Shot 2016-08-05 at 4.48.43 PM" width="683" height="115"><br> </a>5b. Use the token generated to create the Avi SE ‘day0’ file. The ‘day0’ file needs to be a valid ‘yml’ file whose name starts with ‘avi_meta_data’. Sample configuration of the SE day0 file is shown here. Details include the management IP of the Avi SE and netmask, Avi SE management gateway, Avi Controller IP and the token that we generated in step 5a from the Avi Controller.
<a href="img/Screen-Shot-2016-08-05-at-5.13.45-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.13.45-PM.png" alt="Screen Shot 2016-08-05 at 5.13.45 PM" width="600" height="123"></a><img src="img/Screen-Shot-2016-08-05-at-5.14.11-PM.png" alt="Screen Shot 2016-08-05 at 5.14.11 PM" width="600" height="160">
1. Log into the CSP dashboard and navigate to Configuration > Repository to upload the Avi SE qcow2 image and the Avi SE day0 file.
1. Configure an Avi SE service :7a. Enter the name of the Avi SE service in the ‘Service Name’ field and hit enter. Choose the server on which the SE would be deployed in the ‘Target Host Name’ field and hit enter.<a href="img/Screen-Shot-2016-08-05-at-5.17.11-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.17.11-PM.png" alt="Screen Shot 2016-08-05 at 5.17.11 PM" width="600" height="347"><br> </a>7b. In the ‘Image Name’ section, choose the Avi SE qcow2 image and the corresponding Avi SE day0 yml file.<a href="img/Screen-Shot-2016-08-05-at-5.19.23-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.19.23-PM.png" alt="Screen Shot 2016-08-05 at 5.19.23 PM" width="600" height="324"></a>7c. Configure SE interfaces. Note: This installation guide deploys an Avi SE with 3 interfaces. One of the interfaces would be used for Avi SE management and the other two interfaces would be used for servicing the traffic. The Avi SE management interface needs to have connectivity to the Avi Controller. The Avi SE management interface would be configured with the information contained in the Avi SE ‘day0’ file.
7ci. From the ‘vNIC’ section click on ‘vNIC 1’ and then click on ‘Network Name > External Network’ and then choose the management network (enp1s0f0 in this example). Click on ‘Model and choose ‘virtio.’<a href="img/Screen-Shot-2016-08-05-at-5.21.41-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.21.41-PM.png" alt="Screen Shot 2016-08-05 at 5.21.41 PM" width="600" height="343"><br> </a>7cii. Configure an Avi SE data interface in passthrough SR-IOV mode with VLAN. From the ‘vNIC’ section click on ‘Add vNIC.’ Next, click on ‘vNIC 2,’ and then click on ‘Network Name > External Network.’ Finally, choose a passthrough SR-IOV interface (enp7s0f1 in this example). Note : Avi supports a VLAN configured on a SR-IOV Virtual Function. To add a VLAN to the SR-IOV Virtual Function, click on ‘VLAN’ and enter the VLAN ID.
<a href="img/Screen-Shot-2016-08-05-at-5.25.14-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.25.14-PM.png" alt="Screen Shot 2016-08-05 at 5.25.14 PM" width="600" height="353"></a><img src="img/Screen-Shot-2016-08-05-at-5.25.45-PM.png" alt="Screen Shot 2016-08-05 at 5.25.45 PM" width="600" height="308">7ciii. Configure an Avi SE data interface in non-passthrough mode with ‘virtio’ ( ‘e1000’ is also supported ). From the ‘vNIC’ section click on ‘Add vNIC’ and then click on ‘vNIC 3’ and then click on ‘Network Name > External Network’ and then choose a non passthrough interface (enp7s0f0 in this example).
<a href="img/Screen-Shot-2016-08-05-at-5.28.57-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.28.57-PM.png" alt="Screen Shot 2016-08-05 at 5.28.57 PM" width="671" height="329"></a>
1. From the ‘Resource Config’ section, enter the SE memory in MB, number of CPUs and the disk size in GB and click deploy. An Avi SE service should be deployed on the CSP server. The Avi SE will boot up using the Avi SE qcow2 image that was uploaded, configure itself with the metadata inserted through the Avi SE ‘day0’ yml file, and finally connect to the Avi Controller specified in the Avi SE ‘day0’ yml file.<a href="img/Screen-Shot-2016-08-05-at-5.31.34-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.31.34-PM.png" alt="Screen Shot 2016-08-05 at 5.31.34 PM" width="683" height="423"></a>
<a href="img/Screen-Shot-2016-08-05-at-5.32.16-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.32.16-PM.png" alt="Screen Shot 2016-08-05 at 5.32.16 PM" width="683" height="121"></a>
1. Log in to the Avi Controller and navigate to the ‘Infrastructure’ page. From the Dashboard click on the Avi SE once it is up, and assign static IPs to the data interfaces. This completes the deployment of an Avi SE.
<a href="img/Screen-Shot-2016-08-03-at-6.35.21-PM.png"><img src="img/Screen-Shot-2016-08-03-at-6.35.21-PM.png" alt="Screen Shot 2016-08-03 at 6.35.21 PM" width="700" height="495"><br> </a><a href="img/Screen-Shot-2016-08-05-at-5.35.27-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.35.27-PM.png" alt="Screen Shot 2016-08-05 at 5.35.27 PM" width="689" height="155"></a> <a href="img/Screen-Shot-2016-08-05-at-5.36.26-PM.png"><img src="img/Screen-Shot-2016-08-05-at-5.36.26-PM.png" alt="Screen Shot 2016-08-05 at 5.36.26 PM" width="689" height="202"></a>

 

 

## Initial Setup of Avi Controller for Linux Cloud

Use a browser to navigate to the Avi Controller IP address, and follow the below steps to perform initial setup:

1. Configure an administrator password and enter DNS information:

<img src="img/linux-server-cloud-ctlrwiz1-1.png" alt="Ctlr-install-wizard-adminacct_16_1" width="236" height="292" align="left"> <img src="img/linux-server-cloud-ctlrwiz2-1.png" alt="bare-metal-ctlrdeploy-dnsntp" width="236" height="311" align="left" hspace="12" vspace="0">
1. Choose Linux as the infrastructure type: <img src="img/Ctlr-setup-infra-linuxservercloud.png" alt="Ctlr-setup-infra-linuxservercloud" width="236" height="375">
1. On the Tenant Settings wizard page, select No.<img src="img/Ctlr-setup-tenantsettings-linuxservercloud.png" alt="Ctlr-setup-tenantsettings-linuxservercloud" width="236" height="293">

## Deploy Linux Host

This section walks through the workflow for deploying a Linux host on CSP, with an interface connected in passthrough mode. The Avi Service Engine will be installed on top of Linux.

1. Upload the Linux ISO image from the local drive to the CSP repository.
1. Navigate to Configuration > Services.
<a href="img/linux-server-cloud-csp2100-5.png"><img src="img/linux-server-cloud-csp2100-5.png" alt="linux-server-cloud-csp2100-5" width="933" height="347"></a>
1. Click on Create.
1. Enter “SE1” in the Service Name field and press Enter.
1. Click on Target Host Name and select the host from the list.
1. Click on Image Name and select the RHEL ISO image from the list.
1. Click on vNIC > vNIC1 and select External Network > enp7s0f0, VLAN Type > Passthrough > PCIE. (This is a data vNIC.)
1. Click Add vNic > vNIC2 and select External Network > enp1s0f0. (This is the management vNIC.) Click on Mode to change it to virtio.
1. Under Resource Config, set the number of cores to 4, set the RAM to 12288 MB, and set the disk space to 30 GB.
1. Click on Deploy.
1. The final configuration should look something like this:
<a href="img/linux-server-cloud-csp2100-6.png"><img src="img/linux-server-cloud-csp2100-6.png" alt="linux-server-cloud-csp2100-6" width="915" height="568"> </a><a href="img/linux-server-cloud-csp2100-7.png"><img src="img/linux-server-cloud-csp2100-7.png" alt="linux-server-cloud-csp2100-7" width="918" height="219"></a>
1. Open the console and walk through the Linux installation wizard.

 

## Linux Host Static IP Configuration

1. Login to the Linux host from the console (credentials root/default).
1. List the interfaces.
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>  eth0 is the management interface and ens3 is the data interface.
1. Edit/create the config file for the management interface to read as below:
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>  In above example, 10.128.2.18 is the management IP and 10.128.2.1 is the gateway IP.
1. Edit/create the config file for the data interface to read as below:
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>  In above example 10.128.12.62 is the data interface IP. Do not configure the gateway IP; this will be configured from the Controller UI.
1. Restart network for the configuration to take effect. This may take some time.
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>
1. Check if default gateway is configured correctly. (E.g., 10.128.2.1 is the management default gateway in the below output.)
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>  Note: If the gateway is not configured, restart network again.
1. List the interfaces and check the IPs.
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>

## Install Docker

Avi Vantage for Linux server cloud is distributed as a Docker image. If Docker is not already installed on the Linux host, use the following steps to install it. Internet access may be required for this step. If deploying onto multiple hosts, repeat the applicable installation procedure on each host.

### Centos 7

1. Log in to the Linux host.
1. Update yum packages:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo yum update -y</code></pre>
1. Add the yum repo:
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>
1. Install Docker:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo yum install -y docker-engine</code></pre>
1. Start Docker:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo service docker start</code></pre>
1. To start Docker on boot, run the following command:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo systemctl enable docker</code></pre>
1. Enter the **docker version** command to verify the Docker version that is installed and running.
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>

For the latest Docker installation instructions, please refer to <a href="https://docs.docker.com/engine/installation/linux/centos/">https://docs.docker.com/engine/installation/linux/centos/</a>.

### Red Hat Enterprise Linux 7

1. Register the Linux server with Red Hat:
<pre class="command-line language-bash" data-prompt=": >"><code>subscription-manager register</code></pre>
1. Enable the repository for extra services:
<pre class="command-line language-bash" data-prompt=": >"><code>subscription-manager –enable=rhel-7-server-extras-rpms</code></pre>
1. Install updates to Red Hat:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo yum update</code></pre>
1. Run the following command to add Docker to the yum repository:
<pre class="command-line language-bash" data-prompt=": >"><code>cat &gt;/etc/um.respos.d/docker.repo &lt;</code></pre>
1. Install Docker:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo yum install -y docker-engine</code></pre>
1. Start Docker services:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo systemctl start docker</code></pre>
1. Enable Docker services:
<pre class="command-line language-bash" data-prompt=": >"><code>sudo systemctl enable docker</code></pre>
1. Enter the **docker version** command to verify the Docker version that is installed and running. In this example, the version is 1.8.1:
<pre><code class="language-lua">curl -X POST --user csp-username:csp-password -H "Content-Type: application/json" -d '{
    "service":{
      "disk_size": "70",
      "name": "Controller",
      "power": "on",
      "iso_name": "controller.qcow2",
      "numcpu": 4,
      "memory": 12288,
      "vnics": {
        "vnic": [
                {
                    "nic":"0",
                    "type":"access",
                    "tagged":"false",
                    "network_name":"enp1s0f0"
                }
        ]
      }
    }
}' "https:///api/running/services/" sudo vi /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
            address 10.128.2.20
	netmask 255.255.255.0
	gateway 10.128.2.1
            netserver 8.8.8.8 [root@centos-host ~]# ip a [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE="eth0"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.2.18
NETMASK=255.255.255.0
GATEWAY=10.128.2.1 [root@centos-host ~]# sudo vi /etc/sysconfig/network-scripts/ifcfg-ens3

DEVICE="ens3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
IPADDR=10.128.12.62
NETMASK=255.255.255.0 [root@centos-host ~]#  sudo systemctl network restart [root@centos-host ~]# routel|grep default

       default         10.128.2.1                                       eth0
       default        unreachable                   kernel              lo unspec
       default        unreachable                   kernel              lo unspec [root@centos-host ~]# ip a

1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
   inet 127.0.0.1/8 scope host lo
      valid_lft forever preferred_lft forever
   inet6 ::1/128 scope host
      valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
   link/ether 02:4a:80:02:10:4a brd ff:ff:ff:ff:ff:ff
   inet 10.128.2.18/24 brd 10.128.2.255 scope global eth0
      valid_lft forever preferred_lft forever
   inet6 fe80::4a:80ff:fe02:104a/64 scope link
      valid_lft forever preferred_lft forever
3: ens3: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc mq state UP qlen 1000
   link/ether 90:e2:ba:ac:12:91 brd ff:ff:ff:ff:ff:ff
   inet 10.128.12.62/24 brd 10.128.12.255 scope global ens3
      valid_lft forever preferred_lft forever
   inet6 fe80::92e2:baff:feac:1291/64 scope link
      valid_lft forever preferred_lft forever
4: docker0: &lt;NO-CARRIER,BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc noqueue state DOWN
   link/ether 02:42:23:fb:10:cb brd ff:ff:ff:ff:ff:ff
   inet 172.17.0.1/16 scope global docker0
      valid_lft forever preferred_lft forever sudo tee /etc/yum.repos.d/docker.repo &lt;&lt;-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF docker version
             Client:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.1
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   5604cbe
 Built:        Wed Apr 27 00:34:42 2016
 OS/Arch:      linux/amd64 docker version
             Client:
             Version:      1.8.1
             API version:  1.20
             Go version:   go1.4.2
             Git commit:   d12ea79
             Built:        Thu Aug 13 02:35:49 UTC 2015
             OS/Arch:      linux/amd64
             Server:
             Version:      1.8.1
             API version:  1.20</code></pre>

Note: The latest installation instructions can be found at <a href="https://docs.docker.com/v1.8/installation/rhel/">https://docs.docker.com/v1.8/installation/rhel/</a>.

## Linux Cloud Configuration

This section walks through the workflow to create an SSH user to access the Linux VMs on which the SE image will be created, and the procedure for adding the SEs to the Linux cloud.

### Create SSH User

If an SSH user was not created during initial Avi Controller configuration, use the following steps to create one:

1. On the Avi Controller, navigate to Administration > Settings > SSH Key Settings and click Create.
<a href="img/linux-server-cloud-csp2100-ctlr2.png"><img src="img/linux-server-cloud-csp2100-ctlr2.png" alt="linux-server-cloud-csp2100-ctlr2" width="935" height="631"><br> </a>
1. In the SSH User field, enter "root" and click Generate SSH Key Pair. This step must be done via the root account.
1. Click on Copy To Clipboard and save the copied key to a text file.
1. Click Save.

Note: Alternatively, you can download the key as a text file, after saving the user configuration. Click the download icon to download the file.
<a href="img/linux-server-cloud-csp2100-ctlr3.png"><img src="img/linux-server-cloud-csp2100-ctlr3.png" alt="linux-server-cloud-csp2100-ctlr3" width="939" height="193"></a>

### Create Linux Server Cloud

1. Navigate to Infrastructure > Clouds.
1. Edit Default-Cloud.
1. Select Linux as the cloud type and click Next.
<a href="img/linux-server-cloud-csp2100-ctlr4.png"><img src="img/linux-server-cloud-csp2100-ctlr4.png" alt="linux-server-cloud-csp2100-ctlr4" width="939" height="626"><br> </a>
1. From the pull-down list, select the previously created user (root) and click Complete.
<a href="img/linux-server-cloud-csp2100-ctlr5.png"><img src="img/linux-server-cloud-csp2100-ctlr5.png" alt="linux-server-cloud-csp2100-ctlr5" width="902" height="602"><br> </a>
1. The status icon becomes yellow upon completion of the above configuration. It may take about 5-10 minutes for the Avi Controller to create the Avi SE image. Once the cloud is ready, the status icon turns green.
<a href="img/linux-server-cloud-csp2100-ctlr6.png"><img src="img/linux-server-cloud-csp2100-ctlr6.png" alt="linux-server-cloud-csp2100-ctlr6" width="939" height="199"></a>

### Linux Public Key Management

The public key created in the section above needs to be copied to each Linux host so that the Avi Controller can have passwordless access to the Linux hosts. This is required by the Avi Controller to log onto the Linux host, transfer the SE image onto the host, and start the SE within the Docker container.

1. Log into the Linux host as root.
1. Create the .ssh directory and change to it.
<pre class="command-line language-bash" data-prompt=": >"><code>mkdir .ssh &amp;&amp; chmod 700 .ssh &amp;&amp; cd .ssh</code></pre>
1. Add the Avi Controller’s public key to the authorized key file by pasting the key obtained in the above section into the following command line:
<pre class="command-line language-bash" data-prompt=": >"><code>echo "paste-key-string-copied-from-Controller" &gt; ./authorized_keys</code></pre>
1. Set the proper permissions for the key file:
<pre class="command-line language-bash" data-prompt=": >"><code>chmod 644 authorized_keys</code></pre>

Repeat these steps on each Linux host.

### Adding an SE to the Linux Cloud

1. Navigate to Infrastructure > Clouds.
1. Edit the Default-Cloud created in the section above.
1. Click on Add New Server and enter the management IP address of the Linux host.
1. Select DPDK (set to Yes).
1. Enter the number of cores (2) and amount of memory (4, for 4 GB).
<a href="img/linux-server-cloud-csp2100-ctlr7.png"><img src="img/linux-server-cloud-csp2100-ctlr7.png" alt="linux-server-cloud-csp2100-ctlr7" width="918" height="614"><br> </a>
1. Repeat for each additional Linux host.
1. Click Complete.

### Verifying SE Creation

1. In the Avi Controller web interface, navigate to Infrastructure > Clouds.
1. Click on the row for Default-Cloud. Information for each of the Linux hosts in the cloud is displayed.
<a href="img/linux-server-cloud-csp2100-ctlr8.png"><img src="img/linux-server-cloud-csp2100-ctlr8.png" alt="linux-server-cloud-csp2100-ctlr8" width="936" height="211"><br> </a>

The state information for host 10.128.2.17 in this example is “SSH Failed.” This may be the most common issue encountered during Linux server cloud installation. It indicates that the Avi Controller tried to log into the Linux host with the SSH user account and corresponding key specified during setup, but could not successfully negotiate the handshake. To resolve this issue, check the SSH key copied to the host for correctness and file permissions, and re-add the Linux host to the cloud.

If the Avi Controller is able to log onto the Linux host, the Avi SE is installed on it and the status goes through the following phases:

* Image in Progress
* Image Complete
* Start in Progress
* Started
* In Progress
* Placement Ready

Once the status is Placement Ready, the Avi SE is ready for virtual service creation.

### Default Gateway Configuration

A default gateway needs to be configured so that the SE can reach the back-end pool members.

1. Log in to the Avi Controller and navigate to Infrastructure > Cloud > Default-Cloud, click on the cloud name, and select Static Route.
1. Click on Create Static Route.
1. Select the Default Gateway checkbox.
1. Enter the IP address of the default gateway used to reach the back-end pool members (servers).
<a href="img/linux-server-cloud-csp2100-ctlr9.png"><img src="img/linux-server-cloud-csp2100-ctlr9.png" alt="linux-server-cloud-csp2100-ctlr9" width="692" height="470"><br> </a>
1. Click Save.

### Virtual Floating IP Configuration for SE (Optional)

Creating a floating IP address for SEs is option, and should be considered when using the Legacy Active/Standby high availability mode. For other HA modes, it is not required.

1. To configure a floating IP for the SE interface, navigate to Infrastructure > Cloud > Select Linux Cloud > Service Engine Group.
1. Edit the Default-Group.
1. Select Legacy Active/Standby HA.
1. Enter the floating IP address in the Floating IP Address field.
<a href="img/linux-server-cloud-csp2100-ctlr10.png"><img src="img/linux-server-cloud-csp2100-ctlr10.png" alt="linux-server-cloud-csp2100-ctlr10" width="903" height="604"><br> </a>

Note: If any virtual service is configured before this step, it will need to be disabled before beginning with the configuration, then re-enabled after configuring HA and the floating IP.

## Create Virtual Service

This section walks through the steps for configuring a basic HTTP virtual service. Steps for configuring a source NAT IP address (optional) also are included.
Note: This workflow uses the basic virtual service configuration popup, which is adequate for most deployments. These steps also can be performed by selecting New Virtual Service > Advanced Setup to create the virtual service.

1. Navigate to Applications > Virtual Services.
1. Click New Virtual Service > Basic Setup.
1. Enter the name “VS_HTTP.”
1. Select HTTP as the application type.
1. Enter the VIP address.
1. Enter the back-end pool member (server) IP addresses in the Server IP Addresses field, in comma separated format, and click Add Servers.
1. The final configuration should look similar to the one shown below. Click Save.
<a href="img/linux-server-cloud-csp2100-ctlr11.png"><img src="img/linux-server-cloud-csp2100-ctlr11.png" alt="linux-server-cloud-csp2100-ctlr11" width="909" height="610"><br> </a>

### Per Virtual Service SNAT Configuration

To configure a SNAT IP for the virtual service:

1. Access the edit popup for the virtual service created in the previous section.
<a href="img/linux-server-cloud-csp2100-ctlr12.png"><img src="img/linux-server-cloud-csp2100-ctlr12.png" alt="linux-server-cloud-csp2100-ctlr12" width="935" height="205"><br> </a>
1. Navigate to the Advanced tab and enter the SNAT IP address in the SNAT IP Address field.
<a href="img/linux-server-cloud-csp2100-ctlr13.png"><img src="img/linux-server-cloud-csp2100-ctlr13.png" alt="linux-server-cloud-csp2100-ctlr13" width="904" height="607"><br> </a>