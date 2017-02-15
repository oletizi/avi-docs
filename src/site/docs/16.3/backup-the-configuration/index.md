---
title: CLI&#58; Back Up the Configuration
layout: layout163
---
The Avi Controller maintains a local database to store its configuration information. This includes all configuration related to tenants, virtual services, pools, policies and accounts. The Controller configuration can be exported as a JSON file. The JSON file provides a backup for the Controller. Portions of a Controller's exported configuration also can be migrated into the configurations of other Controllers.

All or portions of a Controller configuration may be backed up or moved to another Controller cluster using the CLI.

The scope of the exported configuration can be one of the following:

* Entire system configuration 
* Subset based on the access rights of the current user and tenant of the administrator 
* Single virtual service and its child properties  

## Exporting a Configuration

The following commands will export the configuration to a file named *config_export*, SCP it to a remote location, then return to the Avi shell.  

<pre class="">: &gt; export configuration file config_export
Completed writing the export configuration to config_export
: &gt; bash
admin@Avi-Controller:~$ pwd
/home/admin
admin@Avi-Controller:~$ ls
config_export
admin@Avi-Controller:~$ scp ./config_export root@10.1.1.1:/root
root@10.1.1.1's password:
config_export 100% 232KB 431.8KB/s 00:00
admin@Avi-Controller:~$ exit
: &gt;</pre> 

To export only a single virtual service, use the *virtual service* flag instead of the *configuration* flag with the *export* command. The specified virtual service and its child objects (for example, its pools) are exported into the JSON file.

## Importing a Configuration

***Important!*** Before starting a configuration import, ensure that all Controller members of the cluster are up and the cluster leader has the following configuration:
/* Admin account
/* Cluster configuration
/* OpenStack infrastructure (OpenStack deployments only)

The following commands import a backed up configuration to a Controller cluster:

<pre class="">: &gt; import configuration file /home/admin/myconfig keep_uuid
Successfully imported the configuration file</pre> 

The configuration information can be restored to an existing (deployed) Avi Controller or to a new one.

## *Restoring* an Exported Configuration to a New Controller

Use the following steps to restore a backed up configuration (JSON file) to a new Avi Controller. (Also make sure to see the deployment documentation for your cloud infrastructure for more in-depth installation help.)

* Deploy 3 new Controller nodes. (The image type (OVA, qcow2, ami) should match that of the original Controller node from which the configuration was exported.) 
* Choose one Controller as a leader and use the initial setup wizard to configure the initial setup information, including the information for the Controller cluster. 
* Use the CLI or API to import the saved configuration file onto the new Controller.  

Note: If Avi Vantage is deployed in no access mode, the administrator may still be required to manually create Service Engines. Otherwise, the cluster will return to the same state it was in prior to backing up the configuration.  

