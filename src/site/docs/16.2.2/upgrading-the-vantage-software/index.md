---
title: Upgrading the Avi Vantage Software
layout: default
---
Avi Vantage supports a simple system upgrade method wherein all Avi Controller nodes and Service Engine (SE) nodes are upgraded to the newer software version in one upgrade sequence.

## Effect on Existing Configuration

The existing configuration is preserved. After the upgrade completes, Vantage still has its configuration.

## Management Access During Upgrade

During the upgrade process, configuration changes are blocked. The Avi Controller REST API server is switched to read-only access when the upgrade begins. Requests to get upgrade status are allowed but requests to make configuration changes are blocked.

To get status information during the upgrade, send the following request to the Avi Controller REST API server: https:///api/cluster/upgrade/status

The REST API will briefly be unavailable while the Avi Controller nodes reboot.

## Upgrading Avi Vantage

This section provides the steps for system upgrade using the web interface, CLI or REST API. Make sure to upload the image file that applies to how the Avi Controller was deployed:

* Use controller.pkg if the Avi Controller is deployed on a Virtual Machine (VM).
* Use controller_docker.tgz if the Avi Controller is deployed on a bare metal server.
Note: In Mesos deployments, all east-west virtual services will have traffic disruption since they are placed only on one SE per Mesos host.

### Web Interface *(beginning in 16.1)*

1. Navigate to Administration > System Upgrade.
1. Navigate to the Avi Controller image file that applies to your deployment, and click Upload File. The upload progress is shown.
1. After the file upload is complete, click Begin System Upgrade. The Avi Controller upgrades itself and the SEs. The progress for each phase is shown.

### CLI

This section shows an example of the steps for upgrading from 15.x to 16.1.

1. Download the latest version of the controller.pkg file from the Avi Networks <a href="http://avinetworks.com/portal/software">portal</a>.
1. If there are any firewalls in the environment, configure them to allow TCP port 8443 between SE nodes and Avi Controller nodes. (<a href="/2016/02/02/protocol-ports-used-by-vantage-for-management-communication/">List of firewall ports to leave open.</a>)
1. Using SCP, copy controller.pkg to /tmp on the Avi Controller node. If running a 3-node cluster, copy the file only to the primary/leader node.

1. Using SSH, access the Avi Controller's CLI using SSH and enter the **shell** command: <pre pre="" class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="2-100"><code>ssh admin@&lt;IP-of-Avi-Controller&gt;
shell
The shell login username is "admin".
</code>
</pre>

1. At the Avi shell prompt, enter a command such as the following. Replace "/tmp/controller.pkg" with the full path to the file (controller.pkg) you downloaded. <pre pre="" class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="2-100"><code>upgrade system image_path /tmp/controller.pkg</code></pre>

 

1. To see the progress of the upgrade procedure: **show upgrade status**

To complete the process, the Avi Controller node reboots and the SSH session is terminated.

### API

POST https://<controller-ip>/api/cluster/upgrade
DATA:

{"image_path": "controller://upgrade_pkgs/controller.pkg", "force": True or False, "disruptive" : True or False}

* For this API, the image is expected to be under /var/lib/avi/upgrade_pkgs/controller.pkg. Basically, controller:// pseudo-URI refers to /var/lib/avi directory in the controller.
* force = True or False. For every version of the image, there is a min compatible image. If you are upgrading from beyond that image, it will be rejected unless the force flag is set to True. If force flag is set, it will be converted to a disruptive operation.
* disruptive = True or False. If you do not care for the non-disruptive rolling upgrade of SEs and would rather get through upgrade quickly, you can set this flag.

## How Vantage Performs the Upgrade

### Avi Controller Node Upgrade

After the upgrade is initiated, the Avi Controller cluster is upgraded in parallel. All the Avi Controller nodes in the cluster are updated to the newer version and rebooted in parallel. The Avi Controller waits for all the rebooted nodes to come back and re-form the cluster before continuing with the rest of the upgrade steps. If this fails, the Avi Controller will mark upgrade as aborted and roll back cleanly to the previous version.

During the upgrade process, configuration changes are blocked. The Avi Controller REST API server is switched to read-only access once the upgrade begins. Requests to get upgrade status are allowed but requests to make configuration changes are blocked.

To get status information during the upgrade, send the following request to the Avi Controller REST API server: https:///api/cluster/upgrade/status

Note: The REST API will briefly be unavailable while the Avi Controller nodes reboot and come back up.

After all the Avi Controller nodes are upgraded successfully, the upgrade is committed and rolling upgrade of the SEs begins.

### Rolling Service Engine Upgrade

Rolling upgrade of the SEs is initiated by the Avi Controller, once all the Avi Controller nodes are upgraded.

The Service Engines (SEs) within each SE group are upgraded serially. The SE groups themselves are upgraded in parallel.

### HA Mode Determines Virtual Service Availability During Upgrade

The non-disruptive nature of the SE upgrade is dictated by the high availability (HA) settings in the SE group.

All virtual services in an SE group will not face traffic disruption if the SE group is configured for high availability in one of the modes below.

### 16.2

HA modes that are non-disruptive during SE upgrade:

* Cluster HA, Active-Active mode

Traffic-disruptive SE Group HA Modes:

* Cluster HA, N+M Buffer mode
* Legacy Active-Standby

### 16.1 and Earlier

HA modes that are non-disruptive during SE upgrade:

* Dedicated active-active SEs
* Dedicated active-standby SEs
* Shared active-active SEs

Traffic-disruptive SE Group HA Modes:

* Shared active-standby SEs
* Best effort