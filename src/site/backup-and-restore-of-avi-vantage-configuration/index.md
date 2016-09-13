---
title: Backup and Restore of Avi Vantage Configuration
layout: default
---
Periodic backup of the Avi Vantage configuration database is recommended. In addition, it is a best practice to store the backups in a safe, external location, in the unlikely event that a disaster destroys the entire Avi Controller (or cluster), with no possibility of remediation.

### Recommended Backup Schedule

Based on how often the configuration changes, a recommended backup schedule could be daily or even hourly.

Note: Scheduling of backups must be implemented externally to Vantage. Scheduling of automated backups is not supported in Vantage 16.2.

## Backing Up the Vantage Configuration

To back up the Vantage configuration, use the CLI or API commands shown in this section.

### Passphrase for Encrypting Sensitive Fields

Beginning in Vantage 16.1.3, a passphrase can be used to encrypt the sensitive fields in the configuration. Prior to 16.1.3, the sensitive fields were exported in clear text. (The backup configuration had to be stored in a secure location to ensure security of the sensitive fields.)

### CLI

To back up the Vantage configuration, use the following CLI command:
<pre class="">: &gt; export configuration file /tmp/avi_config.json full_system
Please enter the passphrase to encrypt configuration: 
Downloaded the attachment to /tmp/avi_config.json
Completed writing the export configuration to /tmp/avi_config.json</pre>

### API

To back up the Vantage configuration, use the following API request:
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

Note: If running a Vantage version earlier than 16.2, please contact Avi Networks support for help restoring the configuration.

This script imports the backup configuration onto the Avi Controller. If restoring an Avi Controller cluster, this script restores the configuration and also re-adds the other two nodes to the cluster.

1. Create three new Avi Controllers with the same IP address as the original cluster members. (Avi Vantage currently supports only static IP addresses.) At this point, other than having an IP address, each Avi Controller node should be in its factory default state.
1. Log onto one of the Avi Controller node using SSH or SCP. Use the default credentials admin, admin.
1. Run the restore command or script:

* If using SCP: <pre>scp /var/backup/avi_config.json admin@&lt;controller-ip&gt;://tmp/avi_config.json
</pre>
* If using SSH: <pre>/opt/avi/scripts/restore_config.py --config /tmp/avi_config.json --passphrase &lt;passphrase&gt; --username &lt;admin&gt; --password &lt;admin password&gt; 
</pre>