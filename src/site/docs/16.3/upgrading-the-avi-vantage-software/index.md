---
title: Upgrading the Avi Vantage Software
layout: layout163
---
Avi Vantage supports a simple system upgrade method wherein all Avi Controller nodes and Service Engine (SE) nodes are upgraded to the newer software version in one upgrade sequence.

## Effect on Existing Configuration

At the onset of an upgrade, the version of the running Controller cluster is checked. If it is too distant from the release being installed, a warning is emitted and the upgrade is aborted.

If the upgrade is judged possible, the existing configuration is preserved. After the upgrade completes, Avi Vantage still has its configuration.

## Management Access During Upgrade

During the upgrade process, configuration changes are blocked. The Avi Controller REST API server is switched to read-only access when the upgrade begins. Requests to get upgrade status are allowed but requests to make configuration changes are blocked.

To get status information during the upgrade, send the following request to the Avi Controller REST API server: https:///api/cluster/upgrade/status

The REST API will briefly be unavailable while the Avi Controller nodes reboot.

## Upgrading Avi Vantage

This section provides the steps for system upgrade using the web interface, CLI or REST API. Make sure to upload the image file that applies to how the Avi Controller was deployed:

* Use controller.pkg if the Avi Controller is deployed on a Virtual Machine (VM).
* Use controller_docker.tgz if the Avi Controller is deployed on a bare metal server. > Note: In Mesos deployments, all east-west virtual services will have traffic disruption since they are placed only on one SE per Mesos host.
 

### Web Interface *(beginning in 16.1)*

<ol> 
 <li>Navigate to Administration &gt; System Upgrade.</li> 
 <li>Navigate to the Avi Controller image file that applies to your deployment, and click Upload File. The upload progress is shown.</li> 
 <li>After the file upload is complete, click Begin System Upgrade. The Avi Controller upgrades itself and the SEs. The progress for each phase is shown.</li> 
</ol> 

### CLI

This section shows an example of the steps for upgrading from 15.x to 16.1.
<ol> 
 <li>Download the latest version of the controller.pkg file from the Avi Networks <a href="http://avinetworks.com/portal/software">portal</a>.</li> 
 <li>If there are any firewalls in the environment, configure them to allow TCP port 8443 between SE nodes and Avi Controller nodes. (<a href="{% vpath %}/protocol-ports-used-by-avi-vantage-for-management-communication/">List of firewall ports to leave open.</a>)</li>
 <li>Using SCP, copy controller.pkg to /tmp on the Avi Controller node. If running a 3-node cluster, copy the file only to the primary/leader node.</li> 
</ol> <ol start="4"> 
 <li>Using SSH, access the Avi Controller's CLI using SSH and enter the <strong>shell</strong> command:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">ssh admin@&lt;IP-of-Avi-Controller&gt;
shell
The shell login username is "admin".</code></pre> 
  <!-- [Format Time: 0.0005 seconds] --> </li> 
</ol> <ol start="5"> 
 <li>At the Avi shell prompt, enter a command such as the following. Replace "/tmp/controller.pkg" with the full path to the file (controller.pkg) you downloaded.<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">upgrade system image_path /tmp/controller.pkg</code></pre> 
  <!-- [Format Time: 0.0002 seconds] -->  </li> 
</ol> <ol start="6"> 
 <li>To see the progress of the upgrade procedure: <strong>show upgrade status</strong></li> 
</ol> 

To complete the process, the Avi Controller node reboots and the SSH session is terminated.

### API

POST https://<controller-ip>/api/cluster/upgrade
DATA:

{"image_path": "controller://upgrade_pkgs/controller.pkg", "force": True or False, "disruptive" : True or False}

* For this API, the image is expected to be under /var/lib/avi/upgrade_pkgs/controller.pkg. Basically, controller:// pseudo-URI refers to /var/lib/avi directory in the controller.
* force = True or False. For every version of the image, there is a min compatible image. If you are upgrading from beyond that image, it will be rejected unless the force flag is set to True. If force flag is set, it will be converted to a disruptive operation.
* disruptive = True or False. If you do not care for the non-disruptive rolling upgrade of SEs and would rather get through upgrade quickly, you can set this flag. 

## How Avi Vantage Performs the Upgrade

<a name="rolling-service-engine-upgrade"></a>

### Avi Controller Node Upgrade

After the upgrade is initiated, the Avi Controller cluster is upgraded in parallel. All the Avi Controller nodes in the cluster are updated to the newer version and rebooted in parallel. The Avi Controller waits for all the rebooted nodes to come back and re-form the cluster before continuing with the rest of the upgrade steps. If this fails, the Avi Controller will mark upgrade as aborted and roll back cleanly to the previous version.

During the upgrade process, configuration changes are blocked. The Avi Controller REST API server is switched to read-only access once the upgrade begins. Requests to get upgrade status are allowed but requests to make configuration changes are blocked.

To get status information during the upgrade, send the following request to the Avi Controller REST API server: https:///api/cluster/upgrade/status

Note: The REST API will briefly be unavailable while the Avi Controller nodes reboot and come back up.

After all the Avi Controller nodes are upgraded successfully, the upgrade is committed and rolling upgrade of the SEs begins.

### Rolling Service Engine Upgrade

Rolling upgrade of the SEs is initiated by the Avi Controller, once all the Avi Controller nodes are upgraded.

The Service Engines (SEs) within each SE group are upgraded serially. The SE groups themselves are upgraded in parallel.

### 16.3

Virtual services are non-disruptive during SE upgrade, with one exception as listed below.

Upgrades are non-disruptive for virtual services running in:

* Elastic HA, Active-Active mode
* Elastic HA, N+M Buffer mode, for virtual services scaled to two or more SEs
* Legacy Active-Standby mode 

Upgrades are disruptive for virtual services running in:

* Elastic HA, N+M Buffer mode, for virtual services placed on just one SE (not scaled out) 

### Prior to 16.3

HA mode determines virtual service availability during upgrade. The non-disruptive nature of the SE upgrade is dictated by the high availability (HA) settings in the SE group. All virtual services in an SE group will not face traffic disruption if the SE group is configured for high availability in one of the modes below.

### 16.2

HA modes that are non-disruptive during SE upgrade:

* Elastic HA, Active-Active mode 

Traffic-disruptive SE Group HA modes:

* Elastic HA, N+M Buffer mode
* Legacy Active-Standby 

### 16.1 and Earlier

HA modes that are non-disruptive during SE upgrade:

* Dedicated active-active SEs
* Dedicated active-standby SEs
* Shared active-active SEs 

Traffic-disruptive SE Group HA Modes:

* Shared active-standby SEs
* Best effort 