---
title: CLI Top-Level Commands
layout: layout171
---
 

The following are top-level commands shown when pressing tab twice from the shell:

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>Command
</th>
<th>Description
</th>
</tr>
</thead>
<tbody>                           
<tr>   
<td>attach</td>
<td>Connect to a remote Controller or SE. Similar to SSH.</td>
</tr>
<tr>   
<td>clear</td>
<td>Clear the statistics or value of a designated object.</td>
</tr>
<tr>   
<td>configure</td>
<td>Create or modify a new or existing object, such as a VS, pool, profile...</td>
</tr>
<tr>   
<td>convert</td>
<td>Import and convert a configuration from non-Avi load balancers.</td>
</tr>
<tr>   
<td>copy</td>
<td>Copy a file, such as a packet capture or tech-support file.</td>
</tr>
<tr>   
<td>debug</td>
<td>Change debug settings or perform packet captures.</td>
</tr>
<tr>   
<td>delete</td>
<td>Delete an object. Some objects may have dependencies which must be resolved first.</td>
</tr>
<tr>   
<td>do</td>
<td>Execute a show command without exiting the current location or sub-mode.</td>
</tr>
<tr>   
<td>export</td>
<td>Back up the system configuration or a single VS configuration.</td>
</tr>
<tr>   
<td>import</td>
<td>Import a backed up (exported) complete or VS specific configuration.</td>
</tr>
<tr>   
<td>initialplacement</td>
<td>Specify the initial SE for a VS when using manual placement mode.</td>
</tr>
<tr>   
<td>migrate</td>
<td>Move a VS using manual placement mode to a different SE.</td>
</tr>
<tr>   
<td>purge</td>
<td>Remove a file, such as a packet capture or tech-support file.</td>
</tr>
<tr>   
<td>rebalance</td>
<td>Realign the SEs handing virtual services within an SE group.</td>
</tr>
<tr>   
<td>reboot</td>
<td>Reboot part or all of the Avi system. Can also wipe configuration.</td>
</tr>
<tr>   
<td>rediscover</td>
<td>VMware-specific: Initiate discovery of networks and VMs Disable then re-enable a VS.</td>
</tr>
<tr>   
<td>restart</td>
<td>Disable then re-enable a VS.</td>
</tr>
<tr>   
<td>scalein</td>
<td>Reduce by one the number of SEs handling a VS in manual placement mode.</td>
</tr>
<tr>   
<td>scaleout</td>
<td>Increase by one the number of SEs handling a VS in manual placement mode</td>
</tr>
<tr>   
<td>show</td>
<td>Show detailed information and stats on any Avi object.</td>
</tr>
<tr>   
<td>switchto</td>
<td>Switch into a different tenant.</td>
</tr>
<tr>   
<td>terminal</td>
<td>Alter the shell's terminal settings.</td>
</tr>
<tr>   
<td>upgrade</td>
<td>Initiate an upgrade of the Avi system.</td>
</tr>
<tr>   
<td>upload</td>
<td>Upload a specified tech-support debug file to Avi Networks.</td>
</tr>
<tr>   
<td>verifylogin</td>
<td>Validate login settings to a remote orchestrator such as vCenter, APIC, or OpenStack.</td>
</tr>
<tr>   
<td>watch</td>
<td>Updates the result of a command such as show every few seconds.</td>
</tr>
</tbody>
</table> 

### attach

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td>Description:</td>
<td>Connect to a remote Controller or SE. Similar to SSH.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong>attach serviceengine Avi-se-arjnz</strong></td>
</tr>
<tr>   
<td>Top Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>controller</td>
<td>Attach to a Controller shell.</td>
</tr>
<tr>   
<td>serviceengine</td>
<td>Attach to a Service Engine shell.</td>
</tr>
</tbody>
</table> 

### configure

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>                                      
<tr>   
<td>Description</td>
<td>Create or modify a new or existing object, such as a VS, Pool or Profile.</td>
</tr>
<tr>   
<td>Example</td>
<td><strong><code>: &gt; configure pool Test</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags</td>
<td></td>
</tr>
<tr>   
<td>actiongroupconfig</td>
<td>Create or modify an Action Group Config</td>
</tr>
<tr>   
<td>alertconfig</td>
<td>Create or modify an Alert Config</td>
</tr>
<tr>   
<td>alertemailconfig</td>
<td>Create or modify an Alert Email Config</td>
</tr>
<tr>   
<td>alertscriptconfig</td>
<td>Create or modify an Alert Script Config</td>
</tr>
<tr>   
<td>alertsyslogconfig</td>
<td>Create or modify an Alert Syslog Config</td>
</tr>
<tr>   
<td>analyticsprofile</td>
<td>Create or modify an Alert Syslog Config</td>
</tr>
<tr>   
<td>application</td>
<td>Create or modify an Application</td>
</tr>
<tr>   
<td>applicationpersistenceprofile</td>
<td>Create or modify an Application Persistence Profile</td>
</tr>
<tr>   
<td>applicationprofile</td>
<td>Create or modify an Application Profile</td>
</tr>
<tr>   
<td>authprofile</td>
<td>Create or modify an Auth Profile</td>
</tr>
<tr>   
<td>cloud</td>
<td>Create or modify a Cloud</td>
</tr>
<tr>   
<td>cluster</td>
<td>Create or modify a Cluster</td>
</tr>
<tr>   
<td>controller</td>
<td>Create or modify Controller properties</td>
</tr>
<tr>   
<td>healthmonitor</td>
<td>Create or modify a Health Monitor</td>
</tr>
<tr>   
<td>httppolicyset</td>
<td>Create or modify an HTTP Policy Set</td>
</tr>
<tr>   
<td>ipaddrgroup</td>
<td>Create or modify an IP Address Group</td>
</tr>
<tr>   
<td>network</td>
<td>Create or modify a Network</td>
</tr>
<tr>   
<td>networkprofile</td>
<td>Create or modify a Network Profile</td>
</tr>
<tr>   
<td>networksecuritypolicy</td>
<td>Create or modify a Network Security Policy</td>
</tr>
<tr>   
<td>pkiprofile</td>
<td>Create or modify a PKI Profile</td>
</tr>
<tr>   
<td>pool</td>
<td>Create or modify a Pool</td>
</tr>
<tr>   
<td>role</td>
<td>Create or modify a Role</td>
</tr>
<tr>   
<td>serviceengine</td>
<td>Create or modify a Service Engine</td>
</tr>
<tr>   
<td>serviceenginegroup</td>
<td>Create or modify a Service Engine Group</td>
</tr>
<tr>   
<td>serviceengineproperties</td>
<td>Create or modify Service Engine properties</td>
</tr>
<tr>   
<td>sslkeyandcertificate</td>
<td>Create or modify an SSL Key and Certificate Request</td>
</tr>
<tr>   
<td>sslprofile</td>
<td>Create or modify an SSL Profile</td>
</tr>
<tr>   
<td>stringgroup</td>
<td>Create or modify a String Group</td>
</tr>
<tr>   
<td>systemconfiguration</td>
<td>Create or modify a System Configuration</td>
</tr>
<tr>   
<td>tenant</td>
<td>Create or modify a Tenant</td>
</tr>
<tr>   
<td>user</td>
<td>Create or modify a User</td>
</tr>
<tr>   
<td>virtualservice</td>
<td>Create or modify a Virtual Service</td>
</tr>
<tr>   
<td>vrfcontext</td>
<td>Create or modify a VRF Context</td>
</tr>
<tr>   
<td>vsdatascriptset</td>
<td>Create or modify a VS DataScript Set</td>
</tr>
</tbody>
</table> 

### convert

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>         
<tr>   
<td>Description:</td>
<td>Import and convert a configuration from non-Avi load balancers. Supports conversion from F5 BIG-IP Local Traffic Manager configuration. Imported Virtual Services start in a disabled state to avoid IP conflicts.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>convert bigip_configuration</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags</td>
<td></td>
</tr>
<tr>   
<td><code>bigip_ip_addr</code></td>
<td>BIGIP IP address</td>
</tr>
<tr>   
<td><code>filename</code></td>
<td>Avi config file name</td>
</tr>
<tr>   
<td><code>password</code></td>
<td>BIGIP Password</td>
</tr>
<tr>   
<td><code>username</code></td>
<td>BIGIP Username</td>
</tr>
<tr>   
<td><code>virtualservername</code></td>
<td>Convert virtualserver. Name is of the form /partition/virtualservername</td>
</tr>
</tbody>
</table> 

### copy

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td>Description:</td>
<td>Copy a file, such as a packet capture or tech-support file.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>copy file source /tmp/old destination /tmp/new</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td><code>source</code></td>
<td>The source of the original file and path</td>
</tr>
<tr>   
<td><code>destination</code></td>
<td>The destination of the new file and path</td>
</tr>
</tbody>
</table> 

### debug

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Change debug settings or perform packet captures.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>: &gt; debug virtualservice Test-VS</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td><code>controller</code></td>
<td>Controller-specific debug options</td>
</tr>
<tr>   
<td><code>serviceengine</code></td>
<td>Service Engine-specific debug options</td>
</tr>
<tr>   
<td><code>virtualservice</code></td>
<td>Virtual Service specific debug options, including packet capture.</td>
</tr>
</tbody>
</table> 

### delete

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>                                  
<tr>   
<td>Description:</td>
<td>Delete an object. Some objects may have dependencies that must be resolved first.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>delete pool Test-Pool</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>actiongroupconfig</td>
<td>Delete Action Group Config Delete Alert</td>
</tr>
<tr>   
<td>alert</td>
<td>Delete Alert Config</td>
</tr>
<tr>   
<td>alertconfig</td>
<td>Delete Alert Email Config</td>
</tr>
<tr>   
<td>alertemailconfig</td>
<td>Delete Alert Script Config</td>
</tr>
<tr>   
<td>alertscriptconfig</td>
<td>Delete Alert Syslog Config</td>
</tr>
<tr>   
<td>alertsyslogconfig</td>
<td>Delete Analytics Profile</td>
</tr>
<tr>   
<td>application</td>
<td>Delete Application</td>
</tr>
<tr>   
<td>applicationpersistenceprofile</td>
<td>Delete Application Persistence Profile</td>
</tr>
<tr>   
<td>applicationprofile</td>
<td>Delete Application Profile</td>
</tr>
<tr>   
<td>authprofile</td>
<td>Delete Auth Profile</td>
</tr>
<tr>   
<td>cloud</td>
<td>Delete Cloud</td>
</tr>
<tr>   
<td>healthmonitor</td>
<td>Delete Health Monitor</td>
</tr>
<tr>   
<td>httppolicyset</td>
<td>Delete HTTP Policy Set</td>
</tr>
<tr>   
<td>ipaddrgroup</td>
<td>Delete IP Address Group</td>
</tr>
<tr>   
<td>network</td>
<td>Delete Network</td>
</tr>
<tr>   
<td>networkprofile</td>
<td>Delete Network Profile</td>
</tr>
<tr>   
<td>networksecuritypolicy</td>
<td>Delete Network Security Policy</td>
</tr>
<tr>   
<td>pkiprofile</td>
<td>Delete PKI Profile</td>
</tr>
<tr>   
<td>pool</td>
<td>Delete Pool</td>
</tr>
<tr>   
<td>role</td>
<td>Delete Role</td>
</tr>
<tr>   
<td>serviceengine</td>
<td>Delete Service Engine</td>
</tr>
<tr>   
<td>serviceenginegroup</td>
<td>Delete Service Engine Group</td>
</tr>
<tr>   
<td>sslkeyandcertificate</td>
<td>Delete SSL Key and Certificate Request</td>
</tr>
<tr>   
<td>sslprofile</td>
<td>Delete SSL Profile</td>
</tr>
<tr>   
<td>stringgroup</td>
<td>Delete String Group</td>
</tr>
<tr>   
<td>tenant</td>
<td>Delete Tenant</td>
</tr>
<tr>   
<td>user</td>
<td>Delete User</td>
</tr>
<tr>   
<td>virtualservice</td>
<td>Delete Virtual Service</td>
</tr>
<tr>   
<td>vrfcontext</td>
<td>Delete VRF Context</td>
</tr>
<tr>   
<td>vsdatascriptset</td>
<td>Delete VS DataScript Set</td>
</tr>
</tbody>
</table> 

### do

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>     
<tr>   
<td>Description:</td>
<td>Execute a <code>show</code> command without exiting the current location or sub-model.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>do show debug flags virtualservice Test-VS</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td><code>show</code></td>
<td>Show detailed information and stats for any Avi object.</td>
</tr>
</tbody>
</table> 

### export

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>&nbs;
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Back up the system configuration or a single VS configuration.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>export configuration file /tmp/backup_config</code></strong><br> <strong><code>export virtualservice Test-VS file /tmp/Test-VS</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td><code>configuration</code></td>
<td>Export the entire Avi configuration in JSON format.</td>
</tr>
<tr>   
<td><code>serviceengine</code></td>
<td>Export the Service Engine OVA file from Controller for manual install.</td>
</tr>
<tr>   
<td><code>virtualservice</code></td>
<td>Export a specific Virtual Service configuration file including child objects.</td>
</tr>
</tbody>
</table> 

### import

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>    
<tr>   
<td>Description:</td>
<td>Import a backed up (exported) complete or VS specific configuration.</td>
</tr>
<tr>   
<td>Example:</td>
<td><strong><code>import configuration file /tmp/backup_config</code></strong></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
</tbody>
</table> 

### initialplacement

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>     
<tr>   
<td>Description:</td>
<td><code>initialplacement</code><br> <code>virtualservice Test-VS</code><br> <code>servicengine Avi-se-arjni</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td><code>virtualservice</code></td>
<td>Specify the Virtual Service to be assigned to an SE.</td>
</tr>
<tr>   
<td><code>serviceengine</code></td>
<td>Specify the name of the Service Engine to receive the VS.</td>
</tr>
</tbody>
</table> 

### migrate

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>Command
</th>
<th>Description
</th>
</tr>
</thead>
<tbody>        
<tr>   
<td>Description:</td>
<td>Move a Virtual Service using manual placement (No Access or Read Access) mode to a different SE</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>migrate</code><br> <code>virtualservice Test-VS</code><br> <code>serviceengine Avi-se-arjni</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>from_se_ref</td>
<td>Specify the name of the source SE that has the VS.</td>
</tr>
<tr>   
<td>to_host_ref</td>
<td>An option used with <code>to_new_se</code>, specifying the host upon which to create the new Service Engine.</td>
</tr>
<tr>   
<td>to_new_se</td>
<td>Create a new SE and migrate to it.</td>
</tr>
<tr>   
<td>to_se_ref</td>
<td>Migrate to a specific existing SE.</td>
</tr>
</tbody>
</table> 

### purge

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>    
<tr>   
<td>Description:</td>
<td>Remove a file, such as a packet capture or tech-support file.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>purge file source /tmp/backup_config</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
</tbody>
</table> 

### rebalance

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td>Description:</td>
<td>In auto scale mode, sets the frequency upon which the Controller will Inspect an SE group to see if a VS to SE mapping should be adjusted, potentially resulting in a scale in, scale out, or migration.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>rebalance interval 10 se_group_ref My_SE_Group</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>interval</td>
<td>The frequency, in minutes. Default is 5</td>
</tr>
<tr>   
<td>se_group_ref</td>
<td>The name of the SE group to alter.</td>
</tr>
</tbody>
</table> 

### reboot

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Reboot part of all of the Avi system. Can also wipe configuration. With no flags specified, all Controllers and SEs are rebooted.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>reboot</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>clean</td>
<td>Reset the Avi system's configuration and reboot the cluster. Consider making a backup first.</td>
</tr>
<tr>   
<td>node</td>
<td>Reboot the virtual machine of a Controllers within a cluster.</td>
</tr>
<tr>   
<td>serviceengine</td>
<td>Reboot a specific Service Engine. VS disruption will depend on the high availability settings for the SE group.</td>
</tr>
</tbody>
</table> 

### rediscover

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>    
<tr>   
<td>Description:</td>
<td>VMware-specific: Initiate discovery of networks and VMs.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>rediscover vcenter My-vCenter</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
</tbody>
</table> 

### restart

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>    
<tr>   
<td>Description:</td>
<td>Disable then immediately re-enable a VS.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>restart virtualservice Test-VS</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
</tbody>
</table> 

### scalein

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td>Description:</td>
<td>Reduce by one the number of Service Engines handling a virtual service in manual placement mode. There must be a minimum of one SE.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>scalein virtualservice Test-VS</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>from_se_ref</td>
<td>Specify a non-primary SE to stop using for this VS.</td>
</tr>
<tr>   
<td>scalein_primary</td>
<td>Migrate from the primary SE and discontinue use of the SE for this VS.</td>
</tr>
</tbody>
</table> 

### scaleout

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Increase by one the number of SEs handling a VS in manual placement.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>scaleout virtualservice Test-VS</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>to_host_ref</td>
<td>An option used with <code>to_new_se</code>, specifying where to create the new SE.</td>
</tr>
<tr>   
<td>to_new_se</td>
<td>Create a new SE and scale out to it.</td>
</tr>
<tr>   
<td>to_se_ref</td>
<td>Scale out to an existing SE.</td>
</tr>
</tbody>
</table> 

### show

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>                                                                   
<tr>   
<td>Description:</td>
<td>Show detailed information and stats on any Avi object.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>show virtualservice Test-VS summary</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>actiongroupconfig</td>
<td>Show info on an Action Group Config</td>
</tr>
<tr>   
<td>alert</td>
<td>Show info on an Alert</td>
</tr>
<tr>   
<td>alertconfig</td>
<td>Show info on an Alert Config</td>
</tr>
<tr>   
<td>alertemailconfig</td>
<td>Show info on an Alert Email Config</td>
</tr>
<tr>   
<td>alertscriptconfig</td>
<td>Show info on an Alert Script Config</td>
</tr>
<tr>   
<td>alertsyslogconfig</td>
<td>Show info on the an Syslog Config</td>
</tr>
<tr>   
<td>analyticsprofile</td>
<td>Show info on an Analytics Profile</td>
</tr>
<tr>   
<td>apic</td>
<td>Show info on the APIC Graph Instances</td>
</tr>
<tr>   
<td>application</td>
<td>Show info on an Application Folder</td>
</tr>
<tr>   
<td>applicationpersistenceprofile</td>
<td>Show info on an Application Persistence Profile</td>
</tr>
<tr>   
<td>applicationprofile</td>
<td>Show info on an Application Profile</td>
</tr>
<tr>   
<td>authprofile</td>
<td>Show info on an Auth Profile</td>
</tr>
<tr>   
<td>backups</td>
<td>Show available backup files</td>
</tr>
<tr>   
<td>cloud</td>
<td>Show info on the Cloud</td>
</tr>
<tr>   
<td>cluster</td>
<td>Show info on the Cluster</td>
</tr>
<tr>   
<td>config-consistency-check</td>
<td>Show config-consistency-check status</td>
</tr>
<tr>   
<td>config_events</td>
<td>Show info on the Event Log</td>
</tr>
<tr>   
<td>configuration</td>
<td>Show configuration</td>
</tr>
<tr>   
<td>controller</td>
<td>Show Controller properties</td>
</tr>
<tr>   
<td>cpuusage</td>
<td>Show Controller CPU usage</td>
</tr>
<tr>   
<td>debug</td>
<td>Show Virtual Service capture file</td>
</tr>
<tr>   
<td>debug-log</td>
<td>Show Service Engine debugs</td>
</tr>
<tr>   
<td>diskusage</td>
<td>Show Controller disk usage</td>
</tr>
<tr>   
<td>events</td>
<td>Show info on an Event Log</td>
</tr>
<tr>   
<td>file</td>
<td>Show files</td>
</tr>
<tr>   
<td>healthmonitor</td>
<td>Show info on a Health Monitor</td>
</tr>
<tr>   
<td>httppolicyset</td>
<td>Show info on an HTTP Policy Set</td>
</tr>
<tr>   
<td>ipaddrgroup</td>
<td>Show info on an IP Address Group</td>
</tr>
<tr>   
<td>jobs</td>
<td>Show all duration based jobs pending expiry.</td>
</tr>
<tr>   
<td>License</td>
<td>Show info on the Controller License</td>
</tr>
<tr>   
<td>Logcontrollermapping</td>
<td>Show mapping of log Controllers for each VS</td>
</tr>
<tr>   
<td>logs-status</td>
<td>Show logs subsystem status</td>
</tr>
<tr>   
<td>memoryusage</td>
<td>Show Controller memory usage</td>
</tr>
<tr>   
<td>metricsmgr</td>
<td>Show info on a Metrics Entity Runtime</td>
</tr>
<tr>   
<td>network</td>
<td>Show info on a Network</td>
</tr>
<tr>   
<td>networkprofile</td>
<td>Show info on a Network Profile</td>
</tr>
<tr>   
<td>networksecuritypolicy</td>
<td>Show info on a Network Security Policy</td>
</tr>
<tr>   
<td>openstack_audit</td>
<td>Show OpenStack LBaaS vs Avi config audit reports</td>
</tr>
<tr>   
<td>pkiprofile</td>
<td>Show info on a PKI Profile</td>
</tr>
<tr>   
<td>placement</td>
<td>Show info on a Rm VRF Proto</td>
</tr>
<tr>   
<td>pool</td>
<td>Show info on a Pool</td>
</tr>
<tr>   
<td>role</td>
<td>Show info on a Role</td>
</tr>
<tr>   
<td>serviceengine</td>
<td>Show info on a Service Engine</td>
</tr>
<tr>   
<td>serviceenginegroup</td>
<td>Show info on a Service Engine Group</td>
</tr>
<tr>   
<td>serviceengineproperties</td>
<td>Show the Service Engine properties</td>
</tr>
<tr>   
<td>seupgrade</td>
<td>Show an ongoing SE upgrade status</td>
</tr>
<tr>   
<td>sslkeyandcertificate</td>
<td>Show info on an SSL Key and Certificate</td>
</tr>
<tr>   
<td>sslprofile</td>
<td>Show info on an SSL Profile</td>
</tr>
<tr>   
<td>stringgroup</td>
<td>Show info on a String Group</td>
</tr>
<tr>   
<td>systemconfiguration</td>
<td>Show info on the System Configuration</td>
</tr>
<tr>   
<td>systemconfigurationruntime</td>
<td>Show info on the System Configuration Runtime</td>
</tr>
<tr>   
<td>tech-support</td>
<td>Show full tech support</td>
</tr>
<tr>   
<td>tenant</td>
<td>Show info on a Tenant</td>
</tr>
<tr>   
<td>terminal</td>
<td>Show the terminal settings</td>
</tr>
<tr>   
<td>transaction</td>
<td>Show more info on Transaction Stats</td>
</tr>
<tr>   
<td>upgrade</td>
<td>Show upgrade status if one is in-progress</td>
</tr>
<tr>   
<td>user</td>
<td>Show info on the User</td>
</tr>
<tr>   
<td>vcenter</td>
<td>Show info on the specified VMs</td>
</tr>
<tr>   
<td>version</td>
<td>Show a Controller node's version</td>
</tr>
<tr>   
<td>vinfra</td>
<td>Show info on the VI Datastore Contents</td>
</tr>
<tr>   
<td>virtualservice</td>
<td>Show info on a Virtual Service</td>
</tr>
<tr>   
<td>vrfcontext</td>
<td>Show info on a VRF Context</td>
</tr>
<tr>   
<td>vsdatascriptset</td>
<td>Show info on the VS DataScript Set</td>
</tr>
</tbody>
</table> 

### switchto

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>    
<tr>   
<td>Description:</td>
<td>Switch into a different tenant.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>switchto tenant Tenant2</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
</tbody>
</table> 

### terminal

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>        
<tr>   
<td>Description:</td>
<td>Alter the shell's terminal settings.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>terminal session_timeout 240</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>length</td>
<td>Number of rows to show for pagination output. Greater than will pipe to more. Choose 0 for no pagination.</td>
</tr>
<tr>   
<td>session_timeout</td>
<td>Alter the default 15 min timeout to keep an idle terminal session open.</td>
</tr>
<tr>   
<td>timezone</td>
<td>Display timestamps in specified time zone.</td>
</tr>
<tr>   
<td>unhide</td>
<td>Commands show additional, flags. Not recommended for casual use.</td>
</tr>
</tbody>
</table> 

### upgrade

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td>Description:</td>
<td>Initiate an upgrade of the Avi system. This may be done passively (by migrating each SE while upgrading) or disruptively (fast, but it will terminate existing client connections then begin the upgrade).</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>upgrade system image_path /tmp/new_file</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>system</td>
<td>Upgrade the Avi system.</td>
</tr>
<tr>   
<td>ui</td>
<td>Upgrade the Avi UI.</td>
</tr>
</tbody>
</table> 

### upload

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Generate and upload a tech-support debug file to Avi Networks.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>upload tech-support debuglogs filter exclude_logs</code></td>
</tr>
<tr>   
<td>Top-Level Flags</td>
<td></td>
</tr>
<tr>   
<td>exclude_archive</td>
<td>Exclude archived backups.</td>
</tr>
<tr>   
<td>exclude_logs</td>
<td>Exclude client log files (VS logs), which may be quite large.</td>
</tr>
<tr>   
<td>include_se</td>
<td>Include (non-significant) logs may be stored on the SEs.</td>
</tr>
</tbody>
</table> 

### verifylogin

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>       
<tr>   
<td>Description:</td>
<td>Validate the username, password, and path to a remote orchestrator such as vCenter, APIC, or OpenStack.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>verifylogin</code><br> <code>vcenter username</code><br> <code>admin password secret</code><br> <code>vcenter_url 10.1.1.1/login</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>apic</td>
<td>Verify access to an APIC controller.</td>
</tr>
<tr>   
<td>openstack</td>
<td>Verify access to OpenStack.</td>
</tr>
<tr>   
<td>vcenter</td>
<td>Verify access to a VMware vCenter controller.</td>
</tr>
</tbody>
</table> 

### watch

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>     
<tr>   
<td>Description:</td>
<td>Updates the result of a command such as show every few seconds.</td>
</tr>
<tr>   
<td>Example:</td>
<td><code>watch show pool Test-pool server detail | grep -e 'ip\| open_conns'</code></td>
</tr>
<tr>   
<td>Top-Level Flags:</td>
<td></td>
</tr>
<tr>   
<td>show</td>
<td>Select a valid <code>show</code> command syntax to update.</td>
</tr>
</tbody>
</table>  