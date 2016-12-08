---
title: Backup and Restore of Avi Vantage Configuration
layout: default
---
Periodic backup of the Avi Vantage configuration database is recommended. This database defines all clouds, all virtual service, all users, and so on. Any user capable of logging into the admin tenant is authorized to perform a backup. A restore operation spans all the same entities, but can only be performed by the administrator(s) capable of logging into one of the Controllers using SSH or SCP.

It is a best practice to store backups in a safe, external location, in the unlikely event that a disaster destroys the entire Avi Controller (or cluster), with no possibility of remediation. Based on how often the configuration changes, a recommended backup schedule could be daily or even hourly.

## Backing Up the Avi Vantage Configuration

To back up the Avi Vantage configuration, use the UI, CLI commands or API commands shown in this section. Backups can be scheduled or on-demand.

### Scheduled Backup via UI

To view or edit the configuration backup scheduler's current settings, an admin-tenant user first navigates to Administration > System > Configuration Backup as shown below.

<a href="img/configuration_backup.Das_.png"><img class="aligncenter wp-image-15364" src="img/configuration_backup.Das_.png" alt="Scheduling an Avi Vantage configuration backup" width="976" height="566"></a>

To effect changes, one clicks on the pencil icon shown in the above screenshot. The Backup Scheduler editor appears as shown below:

<a href="img/Screen-Shot-2016-10-11-at-6.24.10-PM.png"><img class="wp-image-15366 alignright" src="img/Screen-Shot-2016-10-11-at-6.24.10-PM.png" alt="Avi Vantage Backup Scheduler editor" width="400" height="560"></a>

* **Enable Configuration Backup**: Turns scheduled backups on or off.
* **Frequency**: A value from 0 to 60 to combine with Frequency Unit to determine how often backups are to be taken. 0 indicates the backup sequence has no end time.
* **Frequency Unit**: Backups occur daily by default. Use this field to change the units to minutes, hours, weeks or months.
* **Backup Passphrase**: An optional phrase that is used to encrypt all sensitive fields contained within the backup. Choose a phrase that is not easy to guess and guard it carefully. Data can't be restored without it.
* **Local (on Controller)**: On by default, this switch tells Avi Vantage to preserve the number of indicated backups on the Controller. One can choose the local and remote backup options independently.
* **Number of backups to store**: A number ranging from 0 to 20, default is 4. 0 is equivalent to unchecking the **Local** option. The oldest backup is deleted after the most recent backup successfully completes.
* **Remote Server**: This option is off by default. It is recommended that a remote destination be specified in case the Avi Controller cluster fails in a non-recoverable fashion. One can choose the local and remote backup options independently. Turning this option on causes the Controller to log onto the indicated server using SSH user credentials, and then secure copy (scp) the backup data to the indicated directory.<code></code>  
    * ****Server Address**: **An FQDN or IP address reachable from the Controller
    * **User Credentials**: Use the pulldown menu to select from a previously-defined SSH user or accept the option to create one.
    * **Directory**: If a target directory other than the SSH user's home directory is desired, specify an absolute or relative pathname pointing to a directory to which the SSH user has write access.  

### Scheduled Backup via CLI
<pre>
<code>[admin:10-10-24-52]: &gt; configure scheduler Default-Scheduler</code>
<code>+-------------------+------------------------------------------------+</code>
<code>| Field             | Value                                          |</code>
<code>+-------------------+------------------------------------------------+</code>
<code>| uuid              | scheduler-b5f7e673-8818-44d1-8f74-45238cc08235 |</code>
<code>| name              | Default-Scheduler                              |</code>
<code>| enabled           | True                                           |</code>
<code>| run_mode          | RUN_MODE_PERIODIC                              |</code>
<code>| start_date_time   | 2016-10-09T15:35:46.220623                     |</code>
<code>| frequency         | 1                                              |</code>
<code>| frequency_unit    | SCHEDULER_FREQUENCY_UNIT_DAY                   |</code>
<code>| backup_config_ref | Backup-Configuration                           |</code>
<code>| scheduler_action  | SCHEDULER_ACTION_BACKUP                        |</code>
<code>| tenant_ref        | admin                                          |</code>
<code>+-------------------+------------------------------------------------+</code>
</pre>

<pre>
<code>[admin:10-10-24-52]: &gt; configure backupconfiguration Backup-Configuration</code>
<code>+------------------------+----------------------------------------------------------+</code>
<code>| Field                  | Value                                                    |</code>
<code>+------------------------+----------------------------------------------------------+</code>
<code>| uuid                   | backupconfiguration-5d65f12e-5da1-49e0-b703-ec65ae9a39c6 |</code>
<code>| name                   | Backup-Configuration                                     |</code>
<code>| save_local             | True                                                     |</code>
<code>| maximum_backups_stored | 4                                                        |</code>
<code>| tenant_ref             | admin                                                    |</code>
<code>+------------------------+----------------------------------------------------------+</code>
</pre>

### **Scheduled Backup via API**
<pre>
<code>PUT : api/scheduler/&lt;uuid&gt;</code>
<code>Example PUT data to change scheduler frequency to 1 week:</code>
<code>{'_last_modified': u'1476209663670990',</code>
<code> 'backup_config_ref': 'https://10.10.24.52/api/backupconfiguration/backupconfiguration-5d65f12e-5da1-49e0-b703-ec65ae9a39c6',</code>
<code> 'enabled': True,</code>
<code> 'frequency': 1,</code>
<code> 'frequency_unit': u'SCHEDULER_FREQUENCY_UNIT_WEEK',</code>
<code> 'name': u'Default-Scheduler',</code>
<code> 'run_mode': u'RUN_MODE_PERIODIC',</code>
<code> 'scheduler_action': u'SCHEDULER_ACTION_BACKUP',</code>
<code> 'start_date_time': u'2016-10-09T15:35:46.220623',</code>
<code> 'tenant_ref': u'https://10.10.24.52/api/tenant/admin',</code>
<code> 'url': 'https://10.10.24.52/api/scheduler/scheduler-b5f7e673-8818-44d1-8f74-45238cc08235',</code>
<code> 'uuid': u'scheduler-b5f7e673-8818-44d1-8f74-45238cc08235'}</code>
</pre>

### On-demand Backup via CLI

To back up the Avi Vantage configuration on-demand, at any arbitrary time, use the following CLI command:

<pre class="">: &gt; export configuration file /tmp/avi_config.json full_system
Please enter the passphrase to encrypt configuration: 
Downloaded the attachment to /tmp/avi_config.json
Completed writing the export configuration to /tmp/avi_config.json</pre> 

### On-demand Backup via API

To back up the Avi Vantage configuration on-demand, at any arbitrary time, use the following API request:

<pre>GET https://&lt;controller-ip&gt;/api/configuration/export?full_system=true
</pre> 

To also include a passphrase, use one of the following options:

In versions 16.1.3 and above:

<pre class="">GET https://&lt;controller-ip&gt;/api/configuration/export?full_system=true&amp;passphrase=&lt;passphrase&gt;
</pre> 

In versions 16.2 and above, use the following POST method and include passphrase in the JSON data:

<pre class="">POST https://&lt;controller-ip&gt;/api/configuration/export?full_system=true
JSON data: {"passphrase":"&lt;passphrase&gt;"}</pre> 

Make sure to replace *Avi-Controller-IP* with the IP address of the Avi Controller (if using a single Avi Controller node), or the IP address of the Avi Controller cluster.

## Restoring the Vantage Configuration

If the unlikely should occur and a disaster completely destroys the Avi Controller (or entire cluster), the following script can be used to automate the configuration recovery process:

<pre>/opt/avi/scripts/restore_config.py
</pre> 

Note: If running an Avi Vantage version earlier than 16.2, please contact Avi Networks support for help restoring the configuration.

This script imports the backup configuration onto the Avi Controller. If restoring an Avi Controller cluster, this script restores the configuration and also re-adds the other two nodes to the cluster.
<ol> 
 <li>Create three new Avi Controllers with the same IP address as the original cluster members. (Avi Vantage currently supports only static IP addresses.) At this point, other than having an IP address, each Avi Controller node should be in its factory default state.</li> 
 <li>Log onto one of the Avi Controller node using SSH or SCP. Use the default credentials admin, admin.</li> 
 <li>Run the restore command or script: 
  <ul> 
   <li>If using SCP: <pre crayon="false"><code class="language-cli">scp /var/backup/avi_config.json admin@&lt;controller-ip&gt;://tmp/avi_config.json</code></pre> </li> 
   <li>If using SSH: <pre crayon="false"><code class="language-cli">/opt/avi/scripts/restore_config.py --config /tmp/avi_config.json --passphrase &lt;passphrase&gt; --username &lt;admin&gt; --password &lt;admin password&gt;</code></pre> </li> 
  </ul> </li> 
</ol> 