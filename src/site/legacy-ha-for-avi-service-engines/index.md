---
title: Legacy HA for Avi Service Engines
layout: default
---
Beginning in Avi Vantage 16.2, legacy active/standby high availability (HA) is available for Avi Service Engine (SE) redundancy. Legacy active/standby is useful for migrating from hardware appliance-based solutions.

Avi Vantage also provides <a href="/overview-of-vantage-high-availability">elastic HA</a>, including active/active and N+M modes.

In legacy HA mode, exactly two Avi SEs are configured. One SE carries all the traffic for a virtual service placed on it, and is thus the active SE for that VS. The other SE in the pair is the standby for that VS, carrying no traffic for it while the other SE is healthy. Upon failure of an SE, the surviving SE takes over traffic for all virtual services previously active on the failed SE, while continuing to handle traffic for virtual services already assigned to it. As part of the takeover process, the survivor also takes ownership of all floating addresses, such as VIPs, SNAT-IP, and so on. Two options, compacted and distributed (figure 1), determine whether all active virtual service placements are concentrated onto one SE in a healthy pair or not.
<a href="img/legacy-HA-compacted-and-distributed-loads.png"><img src="img/legacy-HA-compacted-and-distributed-loads.png" width="500" height="278"></a> Figure 1. Legacy HA active/standby, showing compacted and distributed load options. Standby virtual services are shown in light grey.

### Health Monitoring

By default, health checks are sent by both Avi SEs to back-end servers. Optionally, one can disable health monitoring by an SE for virtual services for which it is standing by.

Optionally, health checks for each Avi SE's next-hop gateways also can be enabled. <a href="/gateway-monitoring-for-legacy-ha/">Gateway health checking</a> is supported for both Avi SEs.

### Floating IP Address

Optionally, one or more floating IP addresses can be assigned to an SE group configured for legacy HA. The floating IP address is applicable when the SE interfaces are not in the same subnet as the VIP or source NAT (SNAT) IP addresses that will use the SE group.  One floating interface IP is required per each attached subnet per SE group when configured in Legacy HA mode.

## Configuring Legacy HA

To configure a pair of SEs for legacy HA:

1. Create an SE group for the pair of SEs. Legacy HA requires each pair of active/standby SEs to be in its own SE group.
1. Within each SE group:

* Add 2 SEs.
* Change the SE group's HA mode to legacy HA.
* If applicable, add a floating IP interface.

Detailed steps are provided below.

### Using the Web Interface

### Create an SE Group for each Active/Standby Pair of SEs

1. Navigate to Infrastructure > Clouds.
1. Select the cloud.
1. Select Service Engine Group (figure 2).
1. Click Create Service Engine Group. <a href="img/legacy-ha-gui1.png"><img src="img/legacy-ha-gui1.png" width="408" height="190"></a> Figure 2. Infrastructure > Clouds > Service Engine Group
1. Enter a name for the group.
1. Select Legacy HA Active/Standby, as shown in figure 3. Some fields will disappear, while others, such as Floating IP Address, will appear. <a href="img/Just-the-HA-settings-for-legacy-mode-3.png"><img src="img/Just-the-HA-settings-for-legacy-mode-3.png" width="500" height="173"></a> Figure 3. The HA settings section of the SE group editor. Legacy HA Active/Standby has been selected.
1. If applicable, enter the (optional) floating IP address. <img src="img/distributed-load-option-1.png" width="265" height="96"> Figure 4. When Distribute Load option is selected, a second floating IP field appears.
1. By default, Vantage compacts all virtual services onto one SE within the active/standby pair. To distribute active virtual services across the pair, within the Virtual Service Placement Policy section of the SE group editor, select the Distribute Load option (figure 4). Note that a second floating IP address may be specified. Assign virtual services on an individual basis to one or the other SE in the legacy pair by navigating to the Advanced tab in the virtual service editor.
1. By default, virtual services that fail over are *not* migrated back to the SE that replaces the failed SE. Rather, load will remain compacted on the failover SE. Choose the Auto-redistribute Load option (figure 4) to make failback automatic.
1. The Virtual Services per Service Engine field (figure 3) sets a maximum on the number of virtual services that may be placed, be they compacted onto one SE or not. By its nature, "legacy" is "non-elastic," such that for any given virtual service, exactly *one* placement (onto the virtual service's active SE) will be performed.
1. Finally, uncheck the Health Monitoring on Standby SE(s) option (figure 3) if you prefer it to be performed only by active SEs.
1. Click Save.

### Add the Pair of SEs to the SE Group

1. Navigate to Infrastructure > Clouds.
1. Select the cloud.
1. Select Service Engine.
1. Click the edit icon next to one of the SEs.
1. Select the SE group from the pull-down list. <a href="img/Screen-Shot-2016-07-16-at-4.03.42-PM.png"><img src="img/Screen-Shot-2016-07-16-at-4.03.42-PM.png" width="600" height="467"></a> Figure 5. SE editor

Note: If Vantage was deployed in full access mode, the other SE is automatically added to the same group. If Avi Vantage was installed in no access mode, select the second SE to also add it to the group.

### Placing a Virtual Service on the SE Group

After configuring the SE group for legacy HA, virtual services can be placed on the group. To place a virtual service on the SE group:

1. Navigate to Applications > Virtual Services.

* If creating a new virtual service, select Create > Advanced. Enter a name and the VIP address, then click Advanced.
* If editing an existing virtual service, click the edit icon in the row for the virtual service. Then click Advanced.
* In the Other Settings section, select the SE group from the pull-down list.
* Click Save.

### Using the CLI

This example configures a pair of SEs (10.10.22.80 and 10.10.22.123) for legacy HA.

The following comamnds create a new SE group for the pair of SEs:
<pre><code class="language-lua">: &gt; configure serviceenginegroup NewGroup3
: serviceenginegroup&gt; ha_mode ha_mode_legacy_active_standby
: serviceenginegroup&gt; floating_intf_ip 10.10.1.100
: serviceenginegroup&gt; 
: serviceenginegroup&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.123
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.80
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure virtualservice vs1
: virtualservice&gt; address  10.10.1.99
: virtualservice&gt; se_group_ref NewGroup2
: virtualservice&gt; save</code></pre>  The following commands add the SEs to the new SE group:
<pre><code class="language-lua">: &gt; configure serviceenginegroup NewGroup3
: serviceenginegroup&gt; ha_mode ha_mode_legacy_active_standby
: serviceenginegroup&gt; floating_intf_ip 10.10.1.100
: serviceenginegroup&gt; 
: serviceenginegroup&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.123
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.80
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure virtualservice vs1
: virtualservice&gt; address  10.10.1.99
: virtualservice&gt; se_group_ref NewGroup2
: virtualservice&gt; save</code></pre>  Note: If Vantage was deployed in full access mode, these commands add both SEs to the group. If Avi Vantage was installed in no access mode, additional commands are needed to add the second SE to the group:
<pre><code class="language-lua">: &gt; configure serviceenginegroup NewGroup3
: serviceenginegroup&gt; ha_mode ha_mode_legacy_active_standby
: serviceenginegroup&gt; floating_intf_ip 10.10.1.100
: serviceenginegroup&gt; 
: serviceenginegroup&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.123
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.80
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure virtualservice vs1
: virtualservice&gt; address  10.10.1.99
: virtualservice&gt; se_group_ref NewGroup2
: virtualservice&gt; save</code></pre>  The following commands configure a virtual service vs1 with VIP 10.10.1.99 on the SE group:
<pre><code class="language-lua">: &gt; configure serviceenginegroup NewGroup3
: serviceenginegroup&gt; ha_mode ha_mode_legacy_active_standby
: serviceenginegroup&gt; floating_intf_ip 10.10.1.100
: serviceenginegroup&gt; 
: serviceenginegroup&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.123
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure serviceengine
              10.10.22.123  10.10.22.80
: &gt; configure serviceengine 10.10.22.80
: serviceengine&gt; se_group_ref NewGroup2
: serviceengine&gt; save : &gt; configure virtualservice vs1
: virtualservice&gt; address  10.10.1.99
: virtualservice&gt; se_group_ref NewGroup2
: virtualservice&gt; save</code></pre>