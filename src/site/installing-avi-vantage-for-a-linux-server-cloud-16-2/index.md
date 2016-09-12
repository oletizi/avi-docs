<html>
 <head></head>
 <body>
  --- title: Installing Avi Vantage for a Linux Server Cloud (16.2) layout: default --- This article describes how to install Avi Vantage in a Linux cloud. The instructions in this guide can be used for installing Avi Vantage 16.2. Avi Vantage is a software-based solution that provides real-time analytics and elastic application delivery services, including user-to-application timing, SSL termination, and load balancing. Installing Avi Vantage directly onto Linux servers leverages the raw horsepower of the underlying hardware without the overhead added by a virtualization layer. For example, installing Avi Vantage directly onto Linux servers that support Data Plane Development Kit (DPDK) allows the feature's optimized packet processing to be leveraged for virtual service traffic. Note: If installing Avi SEs directly onto Linux servers that include DPDK, make sure to enable the option in Vantage when adding the host for the Avi SE. ### Docker Container The Avi Vantage Linux server cloud solution uses containerization provided by Docker for support across operating systems and for easy installation. ## Deployment Topologies Vantage can be deployed onto a Linux server cloud in the following topologies.&nbsp;The minimum number of Linux servers required for deployment depends on the deployment topology. A three-Controller cluster is strongly recommended for production environments. 
  <table class="table"> 
   <tbody> 
    <tr> 
     <th width="60%">Deployment Topology</th> 
     <th>Min Linux Servers Required</th> 
     <th>Description</th> 
    </tr> 
    <tr> 
     <td>Single host</td> 
     <td>1</td> 
     <td>Avi Controller and Avi SE both run on a single host.</td> 
    </tr> 
    <tr> 
     <td>Separate hosts</td> 
     <td>2</td> 
     <td>Avi Controller and Avi SE run on separate hosts. The Avi Controller is deployed on one of the hosts. The Avi SE is deployed on the other host.</td> 
    </tr> 
    <tr> 
     <td>3-host cluster</td> 
     <td>3</td> 
     <td>Provides high availability for the Avi Controller.</td> 
    </tr> 
   </tbody> 
  </table> A single instance of the Avi Controller is deployed on each host. At any given time, one of the Avi Controllers is the leader and the other 2 are followers. ### Single-host Deployment Single-host deployment runs the Avi Controller and Avi SE on the same Linux server. This is the simplest topology to deploy. However, this topology does not provide high availability for either the Avi Controller or Avi SE. 
  <a href="img/Screen-Shot-2016-07-22-at-6.05.51-PM.png"><img src="img/Screen-Shot-2016-07-22-at-6.05.51-PM.png" alt="Avi Vantage single-host deployment in a Linux server cloud" width="368" height="301"></a> ### Two-host Deployment Two-host deployment runs the Avi Controller on one Linux server and the Avi SE on another Linux server. 
  <a href="img/Screen-Shot-2016-07-22-at-6.06.43-PM.png"><img src="img/Screen-Shot-2016-07-22-at-6.06.43-PM.png" alt="Avi Vantage two-host deployment in a Linux server cloud" width="570" height="295"></a> ### Three-host&nbsp;Cluster Deployment Three-host deployment requires&nbsp;a separate instance of the Avi Controller on each of 3 Linux servers. 
  <a href="img/Screen-Shot-2016-07-22-at-6.11.19-PM.png"><img src="img/Screen-Shot-2016-07-22-at-6.11.19-PM.png" alt="Avi Vantage three-host deployment in a Linux server cloud" width="745" height="458"></a> In a 3-host cluster deployment, one of the Avi Controller instances is the leader. The other 2 instances are followers. If the leader goes down, one of the followers takes over so that control plane functionality for users is continued. 
  <a name="linux-cloud-instrqmts"></a> ## Deployment Prerequisites This section lists the minimum requirements for installation. ### Hardware Requirements Each Linux server to be managed by Vantage must meet at least the following physical requirements: 
  <table class="table"> 
   <tbody> 
    <tr> 
     <th width="60%">Component</th> 
     <th>Minimum Requirement</th> 
    </tr> 
    <tr> 
     <td>CPU</td> 
     <td>Intel Xeon with 8 cores</td> 
    </tr> 
    <tr> 
     <td>Memory</td> 
     <td>24 GB RAM</td> 
    </tr> 
    <tr> 
     <td>Disk</td> 
     <td>64&nbsp;GB</td> 
    </tr> 
    <tr> 
     <td>Network Interface Controller (NIC)</td> 
     <td>1 x 1 Gbps (Intel NIC 82598 or 82599 controller family)</td> 
    </tr> 
   </tbody> 
  </table> ### Software Requirements Installation of Vantage for a Linux server cloud also requires the following software: 
  <table class="table"> 
   <tbody> 
    <tr> 
     <th width="60%">Software</th> 
     <th>Version</th> 
    </tr> 
    <tr> 
     <td>Avi Vantage (distributed by Avi Networks as Docker image)</td> 
     <td>16.2</td> 
    </tr> 
    <tr> 
     <td>Docker (image management service that runs on Linux)</td> 
     <td>1.6.1 or greater</td> 
    </tr> 
    <tr> 
     <td>Operating system (OS)</td> 
     <td>One of the following:<br> Oracle Enterprise Linux 7.0, 7.1, or 7.2<br> Red Hat Enterprise Linux 7.0, 7.1, or 7.2<br> CentOS 7.0, 7.1, 7.2</td> 
    </tr> 
   </tbody> 
  </table> ## Installation To install Avi Vantage, some installation tasks are performed on each of the Linux hosts: * **Avi Controller host:** The installation wizard for the Avi Controller must be run on the Linux server that will host the Avi Controller. If deploying a 3-host cluster of Avi Controllers, run the wizard only on the host that will be the cluster leader. (The cluster can be configured at any time after installation is complete.) * **Avi SE hosts:** On each Linux server that will host an Avi SE, configuration of some SSH settings is required. At a minimum, an SSH user account must be added to the Avi Controller, and the public key for the account must be installed in the authorized keys store on each of the Avi SE hosts. If an SSH user name other than "root" will be used, some additional steps are required. ### Installation Workflow Vantage deployment for a Linux server cloud consists of the following: 1. Install the Docker platform (if not already installed). 1. Install the Avi Controller image onto a Linux server. 1. Use the setup wizard to perform initial configuration of the Avi Controller: * Vantage user account creation (your Vantage administrator account) * DNS and NTP servers * Infrastructure type (Linux) * SSH account information (required for installation and access to the Avi SE instance on each of the Linux servers that will host an Avi SE) * Avi SE host information (IP address, DPDK, CPUs, memory) * Multitenancy support The SSH, Avi SE host, and multitenancy selection can be configured either using the wizard or later, after completing it. (The wizard times out after a while.) This article provides links for configuring these objects using the Avi Controller web interface. Detailed steps are provided below. ### 1. Install Docker Avi Vantage for Linux server cloud is distributed as a Docker image. If Docker is not already installed on the host (Linux server), use the applicable steps to install it. If deploying onto multiple hosts, repeat the applicable installation procedure on each host. ### Install Docker onto Oracle Linux 1. Install updates to Oracle Linux (OEL): 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>yum update</code></pre> 1. Download and install the latest version of Docker: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>wget –qO- https://get.docker.com/ | sh</code></pre> 1. Start Docker services: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl start&nbsp;docker</code></pre> 1. Enable Docker services:&nbsp;
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl enable&nbsp;docker</code></pre> 1. If deploying on more than one host, repeat the steps above on each host. ### Install Docker onto Red Hat Linux 1. Register the Linux server with Red Hat: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>subscription-manager register</code></pre> 1. Enable the repository for extra services: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>subscription-manager repos --enable=rhel-7-server-extras-rpms</code></pre> 1. Install updates to Red Hat: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo yum update</code></pre> 1. Install Docker: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo yum install docker</code></pre> 1. Start Docker services: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl start&nbsp;docker</code></pre> 1. Enable Docker services:&nbsp;
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl enable&nbsp;docker</code></pre> 1. If deploying on more than one host, repeat the steps above on each host. ### Install Docker onto&nbsp;CentOS 1. Install updates to CentOS: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo yum update</code></pre> 1. Install Docker: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo yum install docker</code></pre> 1. Start Docker services: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl start&nbsp;docker</code></pre> 1. Enable Docker services:&nbsp;
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo systemctl enable&nbsp;docker</code></pre> 1. If deploying on more than one host, repeat the steps above on each host. ### Verify Docker Installation and Version Enter the **docker version** command to verify the Docker version that is installed and running. In this example, the version is 1.8.1.: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>" data-output="2-15"><code>docker version
Client:
Version: 1.8.1
API version: 1.20
Go version: go1.4.2
Git commit: d12ea79
Built: Thu Aug 13 02:35:49 UTC 2015
OS/Arch: linux/amd64
Server:
Version: 1.8.1
API version: 1.20
Go version: go1.4.2
Git commit: d12ea79
Built: Thu Aug 13 02:35:49 UTC 2015
OS/Arch: linux/amd64</code></pre> ### 2. Install Avi Controller Image 1. Use SCP to copy the .tgz package onto the Linux server that will host the Avi Controller: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>scp docker_install.tar.gz root@Host-IP:/tmp/</code></pre> 1. Use SSH to log into the host: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>ssh root@Host-IP</code></pre> 1. Change to the /tmp directory: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>cd /tmp/</code></pre> 1. Unzip the .tgz package: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo tar -xvf docker_install.tar.gz</code></pre> 1. Run the setup.py script. The setup script can be run in interactive mode or as a single command string. * If entered as a command string, the script sets the options that are included in the command string to the specified values, and leaves the other values set to their defaults. Go to Step 6. * In interactive mode, the script displays a prompt for configuring each option. Go to Step 7. 1. To run the setup script as a single command, enter a command string such as the following: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>./avi_baremetal_setup.py -c -cc 8 -cm 24 -i 10.120.0.39 -m 10.120.0.39</code></pre> The options are explained in the CLI help: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>" data-output="2-20"><code>avi_baremetal_setup.py [-h] [-d] [-s] [-sc SE_CORES] [-sm SE_MEMORY_MB] [-c] [-cc CON_CORES] [-cm CON_MEMORY_GB] -i CONTROLLER_IP -m MASTER_CTL_IP-h, --help show this help message and exit
-d, --dpdk_mode Run SE in DPDK Mode. Default is False
-s, --run_se Run SE locally. Default is False
-sc SE_CORES, --se_cores SE_CORES
Cores to be used for AVI SE. Default is 1
-sm SE_MEMORY_MB, --se_memory_mb SE_MEMORY_MB
Memory to be used for AVI SE. Default is 2048
-c, --run_controller Run Controller locally. Default is No
-cc CON_CORES, --con_cores CON_CORES
Cores to be used for AVI Controller. Default is 4
-cm CON_MEMORY_GB, --con_memory_gb CON_MEMORY_GB
Memory to be used for AVI Controller. Default is 12
-i CONTROLLER_IP, --controller_ip CONTROLLER_IP
Controller IP Address
-m MASTER_CTL_IP, --master_ctl_ip MASTER_CTL_IP
Master controller IP Address</code></pre> 1. To run in interactive mode, start by entering "avi_baremetal_setup.py". Here is an example:
  <pre class="command-line language-bash" data-prompt=":&nbsp;>" data-output="2-99"><code>./avi_baremetal_setup.pyWelcome to AVI Initialization ScriptDPDK Mode:
Pre-requisites(DPDK): This script assumes the below utilities are installed:
docker (yum -y install docker)
Supported Nics(DPDK): Intel 82599/82598 Series of Ethernet Controllers
Supported Vers(DPDK): OEL/CentOS/RHEL - 7.0,7.1,7.2Non-DPDK Mode:
Pre-requisites: This script assumes the below utilities are installed:
docker (yum -y install docker)
Supported Vers: OEL/CentOS/RHEL - 7.0,7.1,7.2Caution : This script deletes existing AVI docker containers &amp; images.Do you want to proceed in DPDK Mode [y/n] y
Do you want to run AVI Controller on this Host [y/n] y
Do you want to run AVI SE on this Host [y] n
Enter The Number Of Cores For AVI Controller. Range [4, 39] 8
Please Enter Memory (in GB) for AVI Controller. Range [12, 125] 24
Please Enter directory path for Avi Controller Config (Default [/opt/avi/controller/data/])
Please Enter disk (in GB) for Avi Controller config (Default [30G])
Do you have separate partition for Avi Controller Metrics? If yes, please enter directory path, else leave it blank
Do you have separate partition for Avi Controller Client Log? If yes, please enter directory path, else leave it blank
Please Enter Controller IP 10.120.0.39
Please Enter Master Controller IP 10.120.0.39Run SE : No
Run Controller : Yes
Controller Cores : 8
Memory(mb) : 24
Controller IP : 10.120.0.39Disabling AVI Services...
Loading AVI CONTROLLER Image. Please Wait..
kernel.core_pattern = /var/crash/%e.%p.%t.coreInstallation Successful. Starting Services...</code></pre> 1. Start Avi Controller on&nbsp;the host to complete installation: 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>sudo&nbsp;systemctl start avicontroller</code></pre> 1. If deploying a 3-host cluster, repeat the steps above on the hosts for each of the other 2 Controllers. **Note: Following reboot, it takes about 3-5 minutes before the web interface become available. Until the reboot is complete, web interface access will appear to be frozen. This is normal.** ### 3. Perform Initial Setup of Avi Controller 1. Use a web browser to navigate to the Avi Controller and start the setup wizard. 1. Configure basic system settings: * Administrator account * DNS and NTP server information 
  <img src="img/Ctlr-install-wizard-adminacct-162-5.png" alt="Ctlr-install-wizard-adminacct_16_1 Avi Vantage Linux server cloud admin account creation" width="236" height="349" align="left"> 
  <img src="img/bare-metal-ctlrdeploy-dnsntp-262.png" alt="bare-metal-ctlrdeploy-dnsntp Avi Vantage Linux server cloud system settings" width="236" height="307" align="left" hspace="12" vspace="0"> * Choose Linux as the infrastructure type: 
  <img src="img/Ctlr-setup-infra-linuxservercloud-262.png" alt="Ctlr-setup-infra-linuxservercloud-262  Avi Vantage orchestrator integration" width="406" height="644"> * The rest of the configuration information prompted for by the wizard also can be entered now while using the wizard, or any time later, after installation is complete. * SSH user and keys: To use the "root" account (simpler option), select Create SSH User, enter the name, select Generate SSH Key Value Pair and click Generate SSH Key Pair. Then click Copy to clipboard, and save the key in a text file. (This file will be useful soon.) * Avi SE hosts: After SSH access is set up on each Avi SE host, the hosts can be added to the Avi Controller. For now, click Complete. * Multitenancy support: For now, select No. This can be configured at any time later, if needed. * After the wizard closes, see the following articles to complete the installation and create virtual services: 1. 
  <a href="/public-key-management-on-service-engine-host/">Public Key Management on Service Engine Hosts</a> 1. 
  <a href="/docs/latest">Adding Avi Service Engines to a Linux Server Cloud</a> ### 4. Set up SSH Access to the Avi SE Hosts If you are continuing with the wizard, this section describes how to add the SSH account information to the Avi Controller, and to then copy the SSH public key to each of the Avi SE hosts. Note: If the wizard has timed out or you have decided to click through the rest of the wizard and do the SSH setup later, go 
  <a href="/public-key-management-on-service-engine-host/">here instead</a>, when ready. See the same link if using an account other than "root". This section assumes that "root" will be used. **On the Avi Controller:** 1. When the SSH User wizard page appears, click Create SSH User. 
  <a name="copying-ssh-key"></a> 
  <img src="img/Ctlr-setup-sshuser1-linuxservercloud-1.png" alt="Ctlr-setup-sshuser1-linuxservercloud  Avi Vantage Linux server cloud SSH user creation" width="404" height="367"> 
  <a name="copying-ssh-key"></a> 1. Enter the username ("root"). 1. Click Generate, then click Copy to clipboard. 
  <img src="img/Ctlr-setup-sshuser2-linuxservercloud-262.png" alt="Ctlr-setup-sshuser2-linuxservercloud-262  Avi Vantage Linux server cloud SSH key" width="1083" height="705"> 1. Click Save. 1. Open a text editor, paste the key from the clipboard, and save the file. **On each Avi SE Host:** Leaving the wizard open, use another window or device to open a CLI session in the Linux shell on one of the Avi SE hosts. 1. Log into the Linux shell on the Avi SE host (in this example, 10.130.164.76): 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>" data-output="2"><code>ssh avi@10.130.164.76
password:</code></pre> 1. Prepare the Avi SE host for adding the key from the Avi Controller:
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>mkdir .ssh &amp;&amp; chmod 700 .ssh &amp;&amp; cd .ssh</code></pre> 1. Add the Avi Controller's public key to the authorized key file by pasting the key 
  <a href="#copying-ssh-key">copied from the Avi Controller by clicking Copy to clipboard</a> into the following command line:
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>echo "paste-key-file-copied-from-Controller" &gt; .ssh/authorized_keys
chmod 644 authorized_keys</code></pre>Use quotation marks to delimit the pasted key string. (If the authorized_keys file does not already exist, the command string also creates the file.) 1. Repeat these steps on each Avi SE host. **Example:** 
  <pre class="command-line language-bash" data-prompt=":&nbsp;>"><code>mkdir .ssh &amp;&amp; chmod 700 .ssh &amp;&amp; cd .ssh
echo "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmizdHAyNTYAAAAlbmlzdHAyNTYAAABBBAHjOSUo8AVTISniFZ05UwOsce8/CxMhZ0myWFeRJJSnEC/T09EwOj+z6uMbnTEC+AHrYAEMgVCkdlhYfmWlrCg=root@Avi-Controller" &gt; .ssh/authorized_keys
chmod 644 authorized_keys</code></pre> Note: Make sure to paste the public key for the Avi SE in your deployment. The key shown here is only an example and will not work with your Avi SEs. ### 5. Add the Avi SE Hosts to the Avi Controller If you are continuing with the wizard, this section describes how to add the Avi SE hosts to the Avi Controller. Note: This step will not succeed unless SSH setup steps has been completed on the Avi Controller and Avi SE hosts. 1. For each Avi SE host, enter the values and click Add New Host. After all the Avi SE hosts are added, click Complete. 
  <img src="img/Ctlr-setup-servers-linuxservercloud-262.png" alt="Ctlr-setup-servers-linuxservercloud-262 Avi Vantage Linux Server Infrastructure" width="604" height="488"> 1. In the Support Multiple Tenants window, click No: 
  <img src="img/Ctlr-setup-tenantsettings-linuxservercloud-262.png" alt="Ctlr-setup-tenantsettings-linuxservercloud-262  Avi Vantage Linux server cloud tenant settings" width="403" height="328"> In the Avi Controller web interface login popup, enter the user name and password added when using the setup wizard. 
  <a href="img/web-int-login.png"><img src="img/web-int-login.png" alt="web-int-login  Avi Vantage Controller login screen" width="944" height="575"></a> If you clicked through the SSH or Avi SE host pages of the wizard, see the following articles to complete installation: 1. 
  <a href="/public-key-management-on-service-engine-host/">Public Key Management on Service Engine Hosts</a> 1. 
  <a href="/docs/latest">Adding Avi Service Engines to a Linux Server Cloud</a>
 </body>
</html>