---
layout: cli-guide
title: Top-Level Commands
---

<style>
  h4 {
    text-transform: lowercase;
    margin-top: 40px;
  } 
  table { 
    table-layout: fixed; 
  } 
  tr th:first-child, tr td:first-child { 
    width: 200px 
  }
  th {
    text-align: left
  }
</style>
The following are top level commands shown when pressing tab twice from the shell:

| Command          | Description                                                                           |
| ---------------- | ------------------------------------------------------------------------------------- |
| attach           | Connect to a remote Controller or SE. Similar to SSH.                                 |
| clear            | Clear the statistics or value of a designated object.                                 |
| configure        | Create or modify a new or existing object, such as a VS, Pool, Profile...             |
| convert          | Import and convert a configuration from non-Avi load balancers.                       |
| copy             | Copy a file, such as a packet capture or tech-support file.                           |
| debug            | Change debug settings or perform packet captures.                                     |
| delete           | Delete an object. Some objects may have dependencies which must be resolved first.    |
| do               | Execute a show command without exiting the current location or sub-mode.              |
| export           | Back up the system configuration or a single VS configuration.                        |
| import           | Import a backed up (exported) complete or VS specific configuration.                  |
| initialplacement | Specify the initial SE for a VS when using manual placement mode.                     |
| migrate          | Move a VS using manual placement mode to a different SE.                              |
| purge            | Remove a file, such as a packet capture or tech-support file.                         |
| rebalance        | Realign the SEs handing VSs within an SE Group.                                       |
| reboot           | Reboot part or all of the Avi system. Can also wipe configuration.                    |
| rediscover       | VMware specific: Initiate discovery of networks and VMs Disable then re-enable a VS.  |
| restart          | Disable then re-enable a VS.                                                          |
| scalein          | Reduce by one the number of SEs handling a VS in manual placement mode.               |
| scaleout         | Increase by one the number of SEs handling a VS in manual placement mode              |
| show             | Show detailed information and stats on any Avi object.                                |
| switchto         | Switch into a different Tenant.                                                       |
| terminal         | Alter the shell's terminal settings.                                                  |
| upgrade          | Initiate an upgrade of the Avi system.                                                |
| upload           | Upload a specified tech-support debug file to Avi Networks.                           |
| verifylogin      | Validate login settings to a remote orchestrator such as vCenter, APIC, or OpenStack. |
| watch            | Updates the result of a command such as show every few seconds.                       |

#### attach

| ---------------- | ----------------------------------------------------- |
| Description:     | Connect to a remote Controller or SE. Similar to SSH. |
| Example:         | **attach serviceengine Avi-se-arjnz**                 |
| Top Level Flags: |                                                       |
| controller       | Attach to a Controller shell.                         |
| serviceengine    | Attach to a Service Engine shell.                     |

#### configure

| ----------------------------- | ------------------------------------------------------------------------- |
| Description                   | Create or modify a new or existing object, such as a VS, Pool or Profile. |
| Example                       | **`: > configure pool Test`**                                          |
| Top-Level Flags               |                                                                           |
| actiongroupconfig             | Create or modify an Action Group Config                                   |
| alertconfig                   | Create or modify an Alert Config                                          |
| alertemailconfig              | Create or modify an Alert Email Config                                    |
| alertscriptconfig             | Create or modify an Alert Script Config                                   |
| alertsyslogconfig             | Create or modify an Alert Syslog Config                                   |
| analyticsprofile              | Create or modify an Alert Syslog Config                                   |
| application                   | Create or modify an Application                                           |
| applicationpersistenceprofile | Create or modify an Application Persistence Profile                       |
| applicationprofile            | Create or modify an Application Profile                                   |
| authprofile                   | Create or modify an Auth Profile                                          |
| cloud                         | Create or modify a Cloud                                                  |
| cluster                       | Create or modify a Cluster                                                |
| controller                    | Create or modify Controller properties                                    |
| healthmonitor                 | Create or modify a Health Monitor                                         |
| httppolicyset                 | Create or modify an HTTP Policy Set                                       |
| ipaddrgroup                   | Create or modify an IP Address Group                                      |
| network                       | Create or modify a Network                                                |
| networkprofile                | Create or modify a Network Profile                                        |
| networksecuritypolicy         | Create or modify a Network Security Policy                                |
| pkiprofile                    | Create or modify a PKI Profile                                            |
| pool                          | Create or modify a Pool                                                   |
| role                          | Create or modify a Role                                                   |
| serviceengine                 | Create or modify a Service Engine                                         |
| serviceenginegroup            | Create or modify a Service Engine Group                                   |
| serviceengineproperties       | Create or modify Service Engine properties                                |
| sslkeyandcertificate          | Create or modify an SSL Key and Certificate Request                       |
| sslprofile                    | Create or modify an SSL Profile                                           |
| stringgroup                   | Create or modify a String Group                                           |
| systemconfiguration           | Create or modify a System Configuration                                   |
| tenant                        | Create or modify a Tenant                                                 |
| user                          | Create or modify a User                                                   |
| virtualservice                | Create or modify a Virtual Service                                        |
| vrfcontext                    | Create or modify a VRF Context                                            |
| vsdatascriptset               | Create or modify a VS DataScript Set                                      |

#### convert

| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Description:        | Import and convert a configuration from non-Avi load balancers. Supports conversion from F5 BIG-IP Local Traffic Manager configuration. Imported Virtual Services start in a disabled state to avoid IP conflicts. |
| Example:            | **`convert bigip_configuration`**                                                                                                                                                                                  |
| Top-Level Flags     |                                                                                                                                                                                                                    |
| `bigip_ip_addr`     | BIGIP IP address                                                                                                                                                                                                   |
| `filename`          | Avi config file name                                                                                                                                                                                               |
| `password`          | BIGIP Password                                                                                                                                                                                                     |
| `username`          | BIGIP Username                                                                                                                                                                                                     |
| `virtualservername` | Convert virtualserver. Name is of the form /partition/virtualservername                                                                                                                                            |

#### copy

| ---------------- | ----------------------------------------------------------- |
| Description:     | Copy a file, such as a packet capture or tech-support file. |
| Example:         | **`copy file source /tmp/old destination /tmp/new`**        |
| Top-Level Flags: |                                                             |
| `source`         | The source of the original file and path                    |
| `destination`    | The destination of the new file and path                    |

#### debug

| ---------------- | ----------------------------------------------------------------- |
| Description:     | Change debug settings or perform packet captures.                 |
| Example:         | **`: > debug virtualservice Test-VS`**                         |
| Top-Level Flags: |                                                                   |
| `controller`     | Controller-specific debug options                                 |
| `serviceengine`  | Service Engine-specific debug options                             |
| `virtualservice` | Virtual Service specific debug options, including packet capture. |

#### delete

| ----------------------------- | --------------------------------------------------------------------------------- |
| Description:                  | Delete an object. Some objects may have dependencies that must be resolved first. |
| Example:                      | **`delete pool Test-Pool`**                                                       |
| Top-Level Flags:              |                                                                                   |
| actiongroupconfig             | Delete Action Group Config Delete Alert                                           |
| alert                         | Delete Alert Config                                                               |
| alertconfig                   | Delete Alert Email Config                                                         |
| alertemailconfig              | Delete Alert Script Config                                                        |
| alertscriptconfig             | Delete Alert Syslog Config                                                        |
| alertsyslogconfig             | Delete Analytics Profile                                                          |
| application                   | Delete Application                                                                |
| applicationpersistenceprofile | Delete Application Persistence Profile                                            |
| applicationprofile            | Delete Application Profile                                                        |
| authprofile                   | Delete Auth Profile                                                               |
| cloud                         | Delete Cloud                                                                      |
| healthmonitor                 | Delete Health Monitor                                                             |
| httppolicyset                 | Delete HTTP Policy Set                                                            |
| ipaddrgroup                   | Delete IP Address Group                                                           |
| network                       | Delete Network                                                                    |
| networkprofile                | Delete Network Profile                                                            |
| networksecuritypolicy         | Delete Network Security Policy                                                    |
| pkiprofile                    | Delete PKI Profile                                                                |
| pool                          | Delete Pool                                                                       |
| role                          | Delete Role                                                                       |
| serviceengine                 | Delete Service Engine                                                             |
| serviceenginegroup            | Delete Service Engine Group                                                       |
| sslkeyandcertificate          | Delete SSL Key and Certificate Request                                            |
| sslprofile                    | Delete SSL Profile                                                                |
| stringgroup                   | Delete String Group                                                               |
| tenant                        | Delete Tenant                                                                     |
| user                          | Delete User                                                                       |
| virtualservice                | Delete Virtual Service                                                            |
| vrfcontext                    | Delete VRF Context                                                                |
| vsdatascriptset               | Delete VS DataScript Set                                                          |

#### do

| ---------------- | --------------------------------------------------------------------------- |
| Description:     | Execute a `show` command without exiting the current location or sub-model. |
| Example:         | **`do show debug flags virtualservice Test-VS`**                            |
| Top-Level Flags: |                                                                             |
| `show`           | Show detailed information and stats for any Avi object.                     |

#### export

| ---------------- | ---------------------------------------------------------------------------------------------------------- |
| Description:     | Back up the system configuration or a single VS configuration.                                             |
| Example:         | **`export configuration file /tmp/backup_config`**  
**`export virtualservice Test-VS file /tmp/Test-VS`** |
| Top-Level Flags: |                                                                                                            |
| `configuration`  | Export the entire Avi configuration in JSON format.                                                        |
| `serviceengine`  | Export the Service Engine OVA file from Controller for manual install.                                     |
| `virtualservice` | Export a specific Virtual Service configuration file including child objects.                              |

#### import

| ---------------- | -------------------------------------------------------------------- |
| Description:     | Import a backed up (exported) complete or VS specific configuration. |
| Example:         | **`import configuration file /tmp/backup_config`**                   |
| Top-Level Flags: | &nbsp;                                                               |

#### initialplacement

| ---------------- | ------------------------------------------------------------------------------- |
| Description:     | `initialplacement`<br> `virtualservice Test-VS`<br> `servicengine Avi-se-arjni` |
| Top-Level Flags: |                                                                                 |
| `virtualservice` | Specify the Virtual Service to be assigned to an SE.                            |
| `serviceengine`  | Specify the name of the Service Engine to receive the VS.                       |

#### migrate

| ---------------- | ------------------------------------------------------------------------------------------------- |
| Description:     | Move a Virtual Service using manual placement (No Access or Read Access) mode to a different SE   |
| Example:         | `migrate`<br>`virtualservice Test-VS`<br>`serviceengine Avi-se-arjni`                           |
| Top-Level Flags: |                                                                                                   |
| from_se_ref      | Specify the name of the source SE that has the VS.                                                |
| to_host_ref      | An option used with `to_new_se`, specifying the host upon which to create the new Service Engine. |
| to_new_se        | Create a new SE and migrate to it.                                                                |
| to_se_ref        | Migrate to a specific existing SE.                                                                |

#### purge

| ---------------- | ------------------------------------------------------------- |
| Description:     | Remove a file, such as a packet capture or tech-support file. |
| Example:         | `purge file source /tmp/backup_config`                        |
| Top-Level Flags: |                                                               |

#### rebalance

| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Description:     | In auto scale mode, sets the frequency upon which the Controller will Inspect an SE Group to see if a VS to SE mapping should be adjusted, potentially resulting in a scale in, scale out, or migration. |
| Example:         | `rebalance interval 10 se_group_ref My_SE_Group`                                                                                                                                                         |
| Top-Level Flags: |                                                                                                                                                                                                          |
| interval         | The frequency, in minutes. Default is 5                                                                                                                                                                  |
| se_group_ref     | The name of the SE Group to alter.                                                                                                                                                                       |

#### reboot

| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Description:     | Reboot part of all of the Avi system. Can also wipe configuration. With no flags specified, all Controllers and SEs are rebooted. |
| Example:         | `reboot`                                                                                                                          |
| Top-Level Flags: |                                                                                                                                   |
| clean            | Reset the Avi system's configuration and reboot the cluster. Consider making a backup first.                                      |
| node             | Reboot the virtual machine of a Controllers within a cluster.                                                                     |
| serviceengine    | Reboot a specific Service Engine. VS disruption will depend on the high availability settings for the SE Group.                   |

#### rediscover

| ---------------- | -------------------------------------------------------- |
| Description:     | VMware specific: Initiate discovery of networks and VMs. |
| Example:         | `rediscover vcenter My-vCenter`                          |
| Top-Level Flags: |                                                          |

#### restart

| ---------------- | ---------------------------------------- |
| Description:     | Disable then immediately re-enable a VS. |
| Example:         | `restart virtualservice Test-VS`         |
| Top-Level Flags: |                                          |

#### scalein

| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Description:     | Reduce by one the number of Service Engines handling a Virtual Service in manual placement mode. There must be a minimum of one SE. |
| Example:         | `scalein virtualservice Test-VS`                                                                                                    |
| Top-Level Flags: |                                                                                                                                     |
| from_se_ref      | Specify a non-primary SE to stop using for this VS.                                                                                 |
| scalein_primary  | Migrate from the primary SE and discontinue use of the SE for this VS.                                                              |

#### scaleout

| ---------------- | ----------------------------------------------------------------------- |
| Description:     | Increase by one the number of SEs handling a VS in manual placement.    |
| Example:         | `scaleout virtualservice Test-VS`                                       |
| Top-Level Flags: |                                                                         |
| to_host_ref      | An option used with `to_new_se`, specifying where to create the new SE. |
| to_new_se        | Create a new SE and scale out to it.                                    |
| to_se_ref        | Scale out to an existing SE.                                            |

#### show

| ----------------------------- | ------------------------------------------------------ |
| Description:                  | Show detailed information and stats on any Avi object. |
| Example:                      | `show virtualservice Test-VS summary`                  |
| Top-Level Flags:              |                                                        |
| actiongroupconfig             | Show info on an Action Group Config                    |
| alert                         | Show info on an Alert                                  |
| alertconfig                   | Show info on an Alert Config                           |
| alertemailconfig              | Show info on an Alert Email Config                     |
| alertscriptconfig             | Show info on an Alert Script Config                    |
| alertsyslogconfig             | Show info on the an Syslog Config                      |
| analyticsprofile              | Show info on an Analytics Profile                      |
| apic                          | Show info on the APIC Graph Instances                  |
| application                   | Show info on an Application Folder                     |
| applicationpersistenceprofile | Show info on an Application Persistence Profile        |
| applicationprofile            | Show info on an Application Profile                    |
| authprofile                   | Show info on an Auth Profile                           |
| backups                       | Show available backup files                            |
| cloud                         | Show info on the Cloud                                 |
| cluster                       | Show info on the Cluster                               |
| config-consistency-check      | Show config-consistency-check status                   |
| config_events                 | Show info on the Event Log                             |
| configuration                 | Show configuration                                     |
| controller                    | Show Controller properties                             |
| cpuusage                      | Show Controller CPU usage                              |
| debug                         | Show Virtual Service capture file                      |
| debug-log                     | Show Service Engine debugs                             |
| diskusage                     | Show Controller disk usage                             |
| events                        | Show info on an Event Log                              |
| file                          | Show files                                             |
| healthmonitor                 | Show info on a Health Monitor                          |
| httppolicyset                 | Show info on an HTTP Policy Set                        |
| ipaddrgroup                   | Show info on an IP Address Group                       |
| jobs                          | Show all duration based jobs pending expiry.           |
| License                       | Show info on the Controller License                    |
| Logcontrollermapping          | Show mapping of log Controllers for each VS            |
| logs-status                   | Show logs subsystem status                             |
| memoryusage                   | Show Controller memory usage                           |
| metricsmgr                    | Show info on a Metrics Entity Runtime                  |
| network                       | Show info on a Network                                 |
| networkprofile                | Show info on a Network Profile                         |
| networksecuritypolicy         | Show info on a Network Security Policy                 |
| openstack_audit               | Show OpenStack LBaaS vs Avi config audit reports       |
| pkiprofile                    | Show info on a PKI Profile                             |
| placement                     | Show info on a Rm VRF Proto                            |
| pool                          | Show info on a Pool                                    |
| role                          | Show info on a Role                                    |
| serviceengine                 | Show info on a Service Engine                          |
| serviceenginegroup            | Show info on a Service Engine Group                    |
| serviceengineproperties       | Show the Service Engine properties                     |
| seupgrade                     | Show an ongoing SE upgrade status                      |
| sslkeyandcertificate          | Show info on an SSL Key and Certificate                |
| sslprofile                    | Show info on an SSL Profile                            |
| stringgroup                   | Show info on a String Group                            |
| systemconfiguration           | Show info on the System Configuration                  |
| systemconfigurationruntime    | Show info on the System Configuration Runtime          |
| tech-support                  | Show full tech support                                 |
| tenant                        | Show info on a Tenant                                  |
| terminal                      | Show the terminal settings                             |
| transaction                   | Show more info on Transaction Stats                    |
| upgrade                       | Show upgrade status if one is in-progress              |
| user                          | Show info on the User                                  |
| vcenter                       | Show info on the specified VMs                         |
| version                       | Show a Controller node's version                       |
| vinfra                        | Show info on the VI Datastore Contents                 |
| virtualservice                | Show info on a Virtual Service                         |
| vrfcontext                    | Show info on a VRF Context                             |
| vsdatascriptset               | Show info on the VS DataScript Set                     |

#### switchto

| ---------------- | ------------------------------- |
| Description:     | Switch into a different Tenant. |
| Example:         | `switchto tenant Tenant2`       |
| Top-Level Flags: |                                 |

#### terminal

| ---------------- | ------------------------------------------------------------------------------------------------------------------ |
| Description:     | Alter the shell's terminal settings.                                                                               |
| Example:         | `terminal session_timeout 240`                                                                                     |
| Top-Level Flags: |                                                                                                                    |
| length           | Number of rows to show for pagination output. Greater than <length> will pipe to more. Choose 0 for no pagination. |
| session_timeout  | Alter the default 15 min timeout to keep an idle terminal session open.                                            |
| timezone         | Display timestamps in specified time zone.                                                                         |
| unhide           | Commands show additional, flags. Not recommended for casual use.                                                   |

#### upgrade

| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Description:     | Initiate an upgrade of the Avi system. This may be done passively (by migrating each SE while upgrading) or disruptively (fast, but it will terminate existing client connections then begin the upgrade). |
| Example:         | `upgrade system image_path /tmp/new_file`                                                                                                                                                                  |
| Top-Level Flags: |                                                                                                                                                                                                            |
| system           | Upgrade the Avi system.                                                                                                                                                                                    |
| ui               | Upgrade the Avi UI.                                                                                                                                                                                        |

#### upload

| --------------- | -------------------------------------------------------------- |
| Description:    | Generate and upload a tech-support debug file to Avi Networks. |
| Example:        | `upload tech-support debuglogs filter exclude_logs`            |
| Top-Level Flags |                                                                |
| exclude_archive | Exclude archived backups.                                      |
| exclude_logs    | Exclude client log files (VS logs), which may be quite large.  |
| include_se      | Include (non-significant) logs may be stored on the SEs.       |

#### verifylogin

| ---------------- | ------------------------------------------------------------------------------------------------------- |
| Description:     | Validate the username, password, and path to a remote orchestrator such as vCenter, APIC, or OpenStack. |
| Example:         | `verifylogin`<br>`vcenter username`<br>`admin password secret`<br>`vcenter_url 10.1.1.1/login`          |
| Top-Level Flags: |                                                                                                         |
| apic             | Verify access to an APIC controller.                                                                    |
| openstack        | Verify access to OpenStack.                                                                             |
| vcenter          | Verify access to a VMware vCenter controller.                                                           |

#### watch

| ---------------- | ------------------------------------------------------------------------------- |
| Description:     | Updates the result of a command such as show every few seconds.                 |
| Example:         | `watch show pool Test-pool server detail &#124; grep -e 'ip\&#124; open_conns'` |
| Top-Level Flags: |                                                                                 |
| show             | Select a valid `show` command syntax to update.                                 |