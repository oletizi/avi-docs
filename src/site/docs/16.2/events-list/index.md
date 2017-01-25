---
title: Events List
layout: layout162
---
Avi continuously adds additional events which are used to trigger alerts, notify administrators of important information, and are the building blocks of much of the configuration automation. See <a href="/docs/16.2/events-overview">Events Overview</a>, <a href="/docs/16.2/alerts-overview">Alerts Overview</a>, and <a href="/docs/16.2/notifications-overview">Notifications Overview</a> for a larger view of how the event component is used for alerting and automation.

### Events List

This section lists the events that can be used to trigger alerts in Avi Vantage.

* **ADD_NW_FAIL:** Failed to add network(s) <network_name> to SE <se_name> for virtual service <vs_name>. Reason <reason>.
* **ADD_NW_SE:** Network(s) <network_name>.. added for Virtual Service <vs_name>.
* **ANOMALY:** Anomalous metric <metric_id> of value <value> and deviation <deviation> .
* **APIC_ATTACH_CIF_TO_LIF:** Attached CIF to LIF <lifs>.
* **APIC_BAD_CREDENTIALS:** Bad user <name> credentials when logging into APIC Controller <vcenter>.
* **APIC_BIND_VNIC_TO_NETWORK:** Bind vNICs to network <vs_uuid>.
* **APIC_CREATE_CDEV:** Created APIC CDEV <se_uuid>.
* **APIC_CREATE_LIF_CONTEXTS:** Created APIC LIF contexts contract_graphs <contract_graphs>.
* **APIC_CREATE_LIFS:** Created APIC LIFs <lifs>.
* **APIC_CREATE_NETWORK:** Created networks <networks>.
* **APIC_CREATE_TENANT:** Created tenant <tenant_name>.
* **APIC_DELETE_CDEV:** Deleted APIC CDEV <se_uuid>.
* **APIC_DELETE_LIF_CONTEXTS:** Deleted APIC LIF contexts contract_graphs <contract_graphs>.
* **APIC_DELETE_LIFS:** Deleted APIC LIFs <lifs>.
* **APIC_DELETE_NETWORK:** Deleted networks <networks>.
* **APIC_DELETE_TENANT:** Deleted tenant <tenant_name>.
* **APIC_DETACH_CIF_FROM_LIF:** Detached CIF from LIFs <lifs>.
* **APIC_VS_PLACEMENT:** Place virtual service <vs_uuid>.
* **AWS_ACCESS_FAILURE:** AWS access/setup failure.
* **AWS_ACCESS_SUCCESS:** AWS access/setup succeeded.
* **AWS_IMAGE_UPLOAD_FAILURE:** AWS image upload failure.
* **AWS_IMAGE_UPLOAD_SUCCESS:** AWS image upload succeeded.
* **CACHE_OBJ_ALLOC_FAIL:** <value> HTTP cacheable objects dropped due to memory allocation failure.
* **CC_CLUSTER_VIP_CONFIG_FAILURE:** Cluster VIP configuration in cloud failed.
* **CC_CLUSTER_VIP_CONFIG_SUCCESS:** Cluster VIP configuration in cloud succeeded.
* **CC_CLUSTER_VIP_DECONFIG_FAILURE:** Cluster VIP deconfiguration in cloud failed.
* **CC_CLUSTER_VIP_DECONFIG_SUCCESS:** Cluster VIP deconfiguration in cloud succeeded.
* **CC_CONFIG_FAILURE:** Cloud configuration failed.
* **CC_DECONFIG_FAILURE:** Cloud deconfiguration failed.
* **CC_DELETE_VIP_FAILURE:** VS delete failed.
* **CC_GENERIC_FAILURE:** Cloud generic failure.
* **CC_HEALTH_FAILURE:** Cloud health check failed.
* **CC_HEALTH_OK:** Cloud health check passed..
* **CC_IP_ATTACH_FAILURE:** IP attach to port failed.
* **CC_IP_ATTACHED:** IP address attached to port.
* **CC_IP_DETACH_FAILURE:** IP detach failure.
* **CC_IP_DETACHED:** IP address detached from port.
* **CC_MARATHON_SERVICE_PORT_ALREADY_IN_USE:** Application requested a service port already in use.
* **CC_MARATHON_SERVICE_PORT_OUTSIDE_VALID_RANGE:** Application requested a service port outside the range of its Marathon instance.
* **CC_SE_CREATED:** Service Engine created.
* **CC_SE_CREATION_FAILURE:** Service Engine creation failure.
* **CC_SE_DELETED:** Service Engine deleted.
* **CC_SE_DELETION_DETECTED:** Service Engine deleted from cloud.
* **CC_SE_DELETION_FAILURE:** Service Engine delete failed.
* **CC_SYNC_SERVICES_FAILURE:** Sync services failed.
* **CC_SYNC_SERVICES_SUCCESS:** Sync services success.
* **CC_TENANT_INIT_FAILURE:** Initialization of tenant in cloud failed.
* **CC_UPDATE_VIP_FAILURE:** VS create/update failed.
* **CC_VIP_DNS_REGISTER_FAILURE:** DNS registration of VS in Cloud failed.
* **CC_VNIC_ADDED:** New vNIC added to Service Engine.
* **CC_VNIC_ADDITION_FAILURE:** vNIC addition failure.
* **CC_VNIC_DELETED:** vNIC deleted from Service Engine.
* **CC_VNIC_DELETION_FAILURE:** vNIC delete failed.
* **CLOUDSTACK_ACCESS_FAILURE:** CloudStack access/setup failure.
* **CLOUDSTACK_ACCESS_SUCCESS:** CloudStack access/setup succeeded.
* **CLOUDSTACK_IMAGE_UPLOAD_FAILURE:** CloudStack image upload failure.
* **CLOUDSTACK_IMAGE_UPLOAD_SUCCESS:** CloudStack image upload succeeded.
* **CONFIG_ACTION:** Action <action_name> executed by <user>.
* **CONFIG_CREATE:** Config <resource_name> create status is <status> (performed by user <user>).
* **CONFIG_DELETE:** Config <resource_name> delete status is <status> (performed by <user>).
* **CONFIG_INTERNAL_CREATE:** Config <resource_name> created internally.
* **CONFIG_INTERNAL_UPDATE:** Config <resource_name> updated internally.
* **CONFIG_UPDATE:** Config <resource_name> update status is <status> (performed by user <user>).
* **CONN_DROP_MAX_FLOW_TBL:** <value> connection(s) dropped due to flow table limit.
* **CONN_DROP_MAX_PERSIST_TBL:** <value> connection(s) dropped due to persistence table limit.
* **CONN_DROP_MAX_SYN_TBL:** <value> connection(s) dropped due to SYN table limit.
* **CONN_DROP_NO_CONN_MEM:** <value> connection(s) dropped due to insuffience memory.
* **CONN_DROP_NO_PKT_BUFF:** <value> connection(s) dropped due to low packet buffer..
* **CONN_DROP_POOL_LB_FAILURE:** <value> pool load balancing decision(s) failed.
* **CONTROLLER_LEADER_FAILOVER:** Avi Controller cluster leader failover.
* **CONTROLLER_NODE_JOINED:** Controller node <addr> joined the Avi Controller cluster.
* **CONTROLLER_NODE_LEFT:** Controller node <addr> left the Avi Controller cluster.
* **CONTROLLER_SERVICE_FAILURE:** Avi Controller service <service_name> failed.
* **CONTROLLER_WARM_REBOOT:** Avi Controller warm restarted.
* **CREATE_SE_FAIL:** Service Engine <se_name> creation failed.
* **CREATE_SE_TIMEOUT:** Service Engine <se_name> creation timed out.
* **CREATED_SE:** Service Engine <se_name> created.
* **CREATING_SE:** Creating Service Engine <se_name> for virtual service <vs_name>.
* **DEL_NW_SE:** Network(s) <network_name> deleted.
* **DELETE_SE_FAIL:** Service Engine <se_name> deletion failed.
* **DELETED_SE:** Service Engine <se_name> deleted.
* **DELETING_SE:** Deleting Service Engine <se_name>.
* **DISCOVERY_DATACENTER_DEL:** vCenter <vcenter> Discovery Datacenter <obj_name> deleted from vCenter.
* **DUPLICATE_SUBNETS:** IP subnet : <ip_nw> discovered in multiple networks.
* **ESX_HOST_POWERED_DOWN:** vCenter <vcenter> Host <name> powered down.
* **ESX_HOST_UNREACHABLE:** Avi Controller unable to communicate with hosts in vCenter <vcenter>.
* **LICENSE_ADDITION_NOTIF:** License addition.
* **LICENSE_EXPIRY_NOTIF:** License expiry notification.
* **LICENSE_REMOVAL_NOTIF:** License removal.
* **LICENSE_USAGE_CORES:** <current_value>% of total licensed Service Engine cores used.
* **LICENSE_USAGE_SERVERS:** <current_value>% of total licensed backend servers used.
* **LICENSE_USAGE_THROUGHPUT:** <current_value>% of total licensed Service Engine throughput used.
* **LICENSE_USAGE_VS:** <current_value>% of total licensed virtual services used.
* **MESOS_ACCESS_FAILURE:** Mesos access failure.
* **MESOS_ACCESS_SUCCESS:** Mesos access success.
* **MESOS_CREATE_SE_FAIL:** Service Engine create failed.
* **MESOS_CREATED_SE:** Created Service Engine.
* **MESOS_DELETE_SE_FAIL:** Service Engine delete failed..
* **MESOS_DELETED_SE:** Service Engine deleted.
* **MESOS_IMAGE_UPLOAD_FAILURE:** Mesos image upload failure.
* **MESOS_IMAGE_UPLOAD_IN_PROGRESS:** Mesos image upload in progress.
* **MESOS_IMAGE_UPLOAD_SUCCESS:** Mesos image upload success.
* **MESOS_START_SE_FAIL:** Service Engine start failed.
* **MESOS_STARTED_SE:** Service Engine started.
* **MESOS_STOP_SE_FAIL:** Service Engine stop failed.
* **MESOS_STOPPED_SE:** Service Engine stopped.
* **MESOS_UPDATED_HOSTS:** Mesos list of hosts has changed.
* **METRIC_THRESHOLD_UP_VIOLATION:** Threshold exceeded for metric..
* **METRICS_DB_DISK_FULL:** Metrics DB Disk usage reached quota <metrics_db_quota> GB.
* **MGMT_NW_DEL:** vCenter <vcenter> Management Network <obj_name> deleted from vCenter.
* **MGMT_NW_NAME_CHANGED:** vCenter <vcenter> Existing <existing_nw> New <new_nw>.
* **MODIFY_NW:** Network(s) <network_name>.. Modified for virtual service <vs_name>.
* **MODIFY_NW_FAIL:** Modify network(s) <network_name> failed on Service Engine <se_name>. Reason <reason>.
* **NEW_PROBABLE_SRVR:** New Server matching filter in network for pool.
* **NO_HOST_AVAIL:** No host available for placement of new Service Engine virtual machine.
* **OPENSTACK_ACCESS_FAILURE:** OpenStack access/setup failure.
* **OPENSTACK_ACCESS_SUCCESS:** OpenStack access/setup succeeded.
* **OPENSTACK_IMAGE_UPLOAD_FAILURE:** OpenStack image upload failure.
* **OPENSTACK_IMAGE_UPLOAD_SUCCESS:** OpenStack image upload succeeded.
* **OPENSTACK_IP_ATTACH_FAILURE:** IP attach failure.
* **OPENSTACK_IP_ATTACHED:** IP address attached to port.
* **OPENSTACK_IP_DETACH_FAILURE:** IP detach failure.
* **OPENSTACK_IP_DETACHED:** IP address detached from port.
* **OPENSTACK_LBPLUGIN_OP_FAILURE:** OpenStack LBaaS plugin operation failure.
* **OPENSTACK_LBPLUGIN_OP_SUCCESS:** OpenStack LBaaS plugin op success.
* **OPENSTACK_LBPROV_AUDIT_FAILURE:** OpenStack LBaaS audit check failure.
* **OPENSTACK_LBPROV_AUDIT_SUCCESS:** OpenStack LBaaS audit check success.
* **OPENSTACK_SE_CREATION_FAILURE:** Avi Service Engine creation failure.
* **OPENSTACK_SE_DELETION_FAILURE:** Avi Service Engine deletion failure.
* **OPENSTACK_SE_VM_CREATED:** OpenStack Avi Service Engine created.
* **OPENSTACK_SE_VM_DELETED:** OpenStack Avi Service Engine deleted.
* **OPENSTACK_SE_VM_DELETION_DETECTED:** Avi Service Engine deleted in OpenStack.
* **OPENSTACK_SYNC_SERVICES_FAILURE:** OpenStack sync services failure.
* **OPENSTACK_SYNC_SERVICES_SUCCESS:** OpenStack sync services success.
* **OPENSTACK_TENANTS_DELETED:** OpenStack tenants deleted.
* **OPENSTACK_VNIC_ADDED:** New vNIC added to Service Engine.
* **OPENSTACK_VNIC_ADDITION_FAILURE:** vNIC addition failure.
* **OPENSTACK_VNIC_DELETION_FAILURE:** vNIC deletion failure.
* **OPENSTACK_VNIC_REMOVED:** vNIC removed from Service Engine.
* **PKT_BUFF_ALLOC_FAIL:** <value> packet buffer allocation failure(s).
* **PKT_DROP_NO_PKT_BUFF:** <value> packet(s) dropped due to low packet buffer.
* **POOL_DOWN:** Pool is DOWN.
* **POOL_HEALTH_CHANGE:** Pool health score changed from <previous_value> to <value>.
* **POOL_SE_HA_ACTIVE:** Pool is UP on Service Engine <se_name>.
* **POOL_SE_HA_COMPROMISED:** Pool is DOWN on Service Engine <se_name>:<ha_reason>.
* **POOL_UP:** Pool is UP.
* **REBALANCE_VS_MIGRATE:** Action Migrate executed during Auto-Rebalance.
* **REBALANCE_VS_SCALEIN:** Action Scale-In executed during Auto-Rebalance.
* **REBALANCE_VS_SCALEOUT:** Action Scale-Out executed during Auto-Rebalance.
* **REBOOT_SE:** Rebooting unresponsive Service Engine.
* **RM_DEL_NETWORK_FAIL:** Deleting networks from Service Engine failed.
* **SE_CONN_MEM_HIGH:** Connection memory usage over Threshold <threshold> % Current <current_value> %.
* **SE_CPU_HIGH:** CPU usage over Threshold <threshold> % Current <current_value> %.
* **SE_DISK_HIGH:** Disk usage over Threshold <threshold> % Current <current_value> %.
* **SE_DOWN:** Service Engine marked down.
* **SE_DP_HB_FAILED:** Dataplane heartbeat Failed(<hb_type>) to SE <se_uuid2>: <se_uuid1>.
* **SE_EV_POOL_DOWN:** Pool is DOWN.
* **SE_EV_POOL_UP:** Pool is UP.
* **SE_EV_SERVER_DOWN:** Server <hostname> (<addr>:<port>) is DOWN due to health monitor <health_monitor> failure.
* **SE_EV_SERVER_UP:** Server <hostname> (<addr>:<port>) is UP.
* **SE_EV_VS_DOWN:** Virtual service is DOWN.
* **SE_EV_VS_UP:** Virtual service is UP.
* **SE_EXTERNAL_HM_RESTART:** External health monitor process crashed.
* **SE_FATAL_ERROR:** Avi Service Engine crashed.
* **SE_FLOW_TBL_HIGH:** Flow table usage over Threshold <threshold> % Current <current_value> %.
* **SE_GROUP_CLUSTER_DEL:** vCenter <vcenter> Cluster <obj_name> deleted from vCenter.
* **SE_GROUP_HOST_DEL:** vCenter <vcenter> Host <obj_name> deleted from vCenter.
* **SE_GROUP_MGMT_NW_DEL:** vCenter <vcenter> Management Network <obj_name> deleted from vCenter.
* **SE_HEALTH_CHANGE:** Service Engine health score changed from <previous_value> to <value>.
* **SE_HEALTH_CHECK_FAIL:** Service Engine failed health check.
* **SE_HEARTBEAT_FAILURE:** SE Heartbeat failure.
* **SE_HM_EVENT_SHM_DOWN:** Health monitor instance for this server is DOWN.
* **SE_HM_EVENT_SHM_UP:** Health monitor instance for this server is UP.
* **SE_MARKED_DOWN:** SE unreachable - Marked down.
* **SE_MEM_HIGH:** Memory usage over Threshold <threshold> % Current <current_value> %.
* **SE_PERSIST_TBL_HIGH:** Persistence table usage over Threshold <threshold> % Current <current_value> %.
* **SE_PKT_BUFF_HIGH:** Packet buffer usage over Threshold <threshold> % Current <current_value> %.
* **SE_POOL_DELETED:** Pool deleted from Service Engine.
* **SE_POWERED_DOWN:** SE powered down by virtual infrastructure.
* **SE_REBOOTED:** SE rebooted by user.
* **SE_SERVER_APP_CHANGED:** The application (version) running in the Server <hostname> (<addr>:<port>) in Pool <pool> changed.
* **SE_SERVER_DELETED:** Server <hostname> (<addr>:<port>) was deleted.
* **SE_SERVER_DISABLED:** Server <hostname> (<addr>:<port>) in Pool <pool> was disabled.
* **SE_SYN_CACHE_USAGE_HIGH:** SYN cache usage over Threshold <threshold> % Current <current_value> %.
* **SE_SYN_TBL_HIGH:** SYN table usage over Threshold <threshold> % Current <current_value> %.
* **SE_UP:** Avi Service Engine connected to Avi Controller.
* **SE_UPGRADING:** Service Engine upgrade in progress.
* **SE_VERSION_CHECK_FAILED:** SE version does not match Controller version.
* **SE_VM_DELETED:** SE VM deleted from virtual infrastructure.
* **SE_VM_PURGED:** SE VM purged by user.
* **SE_VNIC_DHCP_IP_ALLOC_FAILURE:** IP address allocation failure, Service Engine <se_uuid> vNIC <vnic_name> Network <network_uuid> MAC <mac>.
* **SE_VNIC_DUPLICATE_IP:** Duplicate - IP vNIC <vnic_name> IP <vnic_ip>, Remote MAC <remote_mac>, Local MAC <local_mac>.
* **SE_VNIC_IP_ADDED:** IP address added to vnic, Service Engine <se_uuid> vNIC <if_name> IP <ip> Mask <mask> Mode <mode> Namespace <ns> Network <network_uuid> MAC <mac>.
* **SE_VNIC_IP_REMOVED:** IP address removed from vnic, Service Engine <se_uuid> vNIC <if_name> IP <ip> Mask <mask> Mode <mode> Namespace <ns> Network <network_uuid> MAC <mac>.
* **SERVER_AUTOSCALE_FAILED:** Server Scale-Out failed.
* **SERVER_AUTOSCALE_IN:** Scale-In of <num_scalein_servers> server(s) due to <reason>.
* **SERVER_AUTOSCALE_IN_COMPLETE:** <nscalein> server(s) Scale-In complete.
* **SERVER_AUTOSCALE_OUT:** Scale-Out of <num_scaleout_servers> server(s) due to <reason>.
* **SERVER_AUTOSCALE_OUT_COMPLETE:** <nscaleout> server(s) launch complete..
* **SERVER_DELETED:** Server(s) <server_ip> .. deleted from Virtual Infrastructure.
* **SERVER_DOWN:** Server <hostname> (<addr>:<port>) in Pool <pool> is DOWN due to health monitor <health_monitor> failure.
* **SERVER_DOWN_HA_COMPROMISED:** Server <hostname> (<addr>:<port>) down due to health monitor <health_monitor> failure by at least one but not all Service Engines.
* **SERVER_HEALTH_CHANGE:** <sub_resource_prefix> health score changed from <previous_value> to <value>.
* **SERVER_UP:** Server <hostname> (<addr>:<port>) in Pool <pool> is UP.
* **SERVER_UP_HA_ACTIVE:** Server <hostname> (<addr>:<port>) is active.
* **SSL_CERT_EXPIRE:** SSL certificate expires in <days_left> days.
* **SSL_KEY_EXPORTED:** SSL Private Keys are exported by <user>.
* **SUMMARIZED_SUBNETS:** Overlapping subnets detected in the Cloud Infrastructure.
* **SYSTEM_UPGRADE_ABORTED:** Avi Vantage system upgrade failed and was aborted.
* **SYSTEM_UPGRADE_COMPLETE:** Avi Vantage system upgrade complete.
* **SYSTEM_UPGRADE_STARTED:** Avi Vantage system upgrade started.
* **UPGRADE_ALL_SE_DONE:** Done upgrading <num_se> Service Engines.
* **UPGRADE_ALL_SE_NOT_NEEDED:** Upgrading <num_se> Service Engines not needed.
* **UPGRADE_ALL_SE_START:** Starting upgrade of <num_se> Service Engines with <num_vs> virtual services.
* **UPGRADE_SE_DONE:** Service Engine <se_uuid> upgrade done.
* **UPGRADE_SE_NOT_NEEDED:** Service Engine <se_uuid> already upgraded.
* **UPGRADE_SE_START:** Starting upgrade for Service Engine <se_uuid>.
* **UPGRADE_SE_VS_DISRUPTED:** Virtual service <vs_uuid> upgrade disrupted, Reason <reason>.
* **UPGRADE_SE_VS_MIGRATE:** Action Migrate executed during Service Engine upgrade.
* **UPGRADE_SE_VS_SCALEIN:** Action Scale-In executed during Service Engine upgrade.
* **UPGRADE_SE_VS_SCALEOUT:** Action Scale-Out executed during Service Engine upgrade.
* **USER_LOGIN:** User <user> login from <client_ip>.
* **USER_LOGOUT:** User <user> logout from <client_ip>.
* **USER_PASSWORD_CHANGE_REQUEST:** Password change request for email <user_email> from IP <client_ip>.
* **VCA_ACCESS_FAILURE:** VCA access/setup failure.
* **VCA_ACCESS_SUCCESS:** VCA access/setup succeeded.
* **VCA_IMAGE_UPLOAD_FAILURE:** VCA image upload failure.
* **VCA_IMAGE_UPLOAD_SUCCESS:** VCA image upload succeeded.
* **VCENTER_ADDRESS_ERROR:** Unable to contact vCenter <vcenter>.
* **VCENTER_BAD_CREDENTIALS:** Bad user <name> credentials when logging to vCenter <vcenter>.
* **VCENTER_VERSION_NOT_SUPPORTED:** vCenter <vcenter_name> has a version which is not supported by Avi.
* **VINFRA_DISC_CLUSTER:** vCenter <vcenter> Num Clusters <num_clusters>.
* **VINFRA_DISC_DC:** vCenter <vcenter> Num Datacenter <num_dcs>.
* **VINFRA_DISC_FAILURE:** vCenter <vcenter> Discovery Failure in retrieving <state>. Retrying.
* **VINFRA_DISC_HOST:** vCenter <vcenter> Num Hosts <num_hosts>.
* **VINFRA_DISC_NW:** vCenter <vcenter> Num NWs <num_nws>.
* **VINFRA_DISC_VM:** vCenter <vcenter> discovery found <num_vms> VMs.
* **VM_ADDED:** A new virtual machine (non Service Engine) was created.
* **VM_REMOVED:** An existing virtual machine (non SE) was removed.
* **VS_ADD_SE:** Virtual service <vs_name> added to Service Engine <se_name>. Role: <type>.
* **VS_ADD_SE_INT:** Virtual service <vs_name> added to Service Engine <se_name>. Role: <type>.
* **VS_AWAITING_SE:** Service Engine not assigned to this virtual service even after <awaitingse_timeout> seconds.
* **VS_CONN_LIMIT:** <value> connection(s) dropped due to virtual service connection limit.
* **VS_DOWN:** Virtual service is DOWN.
* **VS_FSM_ACTIVE:** Virtual service active.
* **VS_FSM_ACTIVE_AWAITING_SCALEOUT_READY:** Virtual service awaiting Scale-Out ready status from Service Engine.
* **VS_FSM_ACTIVE_AWAITING_SE_TRANSITION:** Virtual service Active but awaiting more Service Engines.
* **VS_FSM_AWAITING_SE_ASSIGNMENT:** Virtual service awaiting Service Engine assignment.
* **VS_FSM_DISABLED:** Virtual service Disabled.
* **VS_FSM_INACTIVE:** Virtual service is inactive.
* **VS_FSM_PARTITIONED:** Virtual service Partioned due to Service Engine disconnect.
* **VS_FSM_PERMANENT_ERROR:** Virtual Service Permanent Error.
* **VS_FSM_TRANSIENT_ERROR:** Virtual service Transient Error.
* **VS_FSM_UNEXPECTED_EVENT:** Virtual service FSM unexpected event.
* **VS_HEALTH_CHANGE:** Virtual service health score changed from <previous_value> to <value>.
* **VS_INITIAL_PLACEMENT_FAILED:** Virtual service initial placement on a Service Engine failed.
* **VS_MIGRATE_COMPLETE:** Virtual service Migrate Done.
* **VS_MIGRATE_DONE:** Virtual service Migrate Done.
* **VS_MIGRATE_FAILED:** Virtual service Migrate Failed.
* **VS_MIGRATE_SCALEIN_DONE:** Virtual service Scale-In Migrate Done.
* **VS_MIGRATE_SCALEIN_ERROR:** Virtual service Scale-In Migrate Error.
* **VS_MIGRATE_SCALEOUT_DONE:** Virtual service Migrate Scale-Out Complete.
* **VS_MIGRATE_SCALEOUT_ERROR:** Virtual service Migrate Scale-Out Error.
* **VS_MIGRATE_STARTED:** Virtual service Migrate Started.
* **VS_REMOVED_SE:** Virtual service <vs_name> removed from Service Engine <se_name>.
* **VS_REMOVED_SE_INT:** Virtual service <vs_name> removed from Service Engine.
* **VS_RPC_FAILED_EVENT:** Virtual service RPC Request failed.
* **VS_RPC_TO_RESMGR_FAILED_EVENT:** Virtual service RPC to RM failed.
* **VS_RPC_TO_SE_FAILED_EVENT:** Virtual service RPC to Service Engine failed.
* **VS_SCALEIN_COMPLETE:** Virtual service Scale-In Done.
* **VS_SCALEIN_DONE:** Virtual service Scale-In Complete.
* **VS_SCALEIN_DONE_AWAITING_MORE_SE:** Virtual service Scale-In Complete, but awaiting more Service Engines.
* **VS_SCALEIN_ERR:** Virtual service Scale-In Error.
* **VS_SCALEIN_FAILED:** Virtual service Scale-In Failed.
* **VS_SCALEOUT_COMPLETE:** Virtual service Scale-Out Done.
* **VS_SCALEOUT_DONE:** Virtual service Scale-Out complete.
* **VS_SCALEOUT_DONE_AWAITING_MORE_SE:** Virtual service Scale-Out complete, but awaiting more Service Engines.
* **VS_SCALEOUT_ERR:** Virtual service Scale-Out Error.
* **VS_SCALEOUT_FAILED:** Virtual service Scale-Out Failed.
* **VS_SE_BOOTUP_FAIL:** Service Engine <se_name> failed to boot.
* **VS_SE_HA_ACTIVE:** Virtual service is UP on Service Engine <se_name>.
* **VS_SE_HA_COMPROMISED:** Virtual service is DOWN on Service Engine <se_name>:<ha_reason>.
* **VS_SE_IP_FAIL:** SE <se_name> failed to acquire IP address on network(s) <network_name> subnet(s) <subnet>.
* **VS_THROUGHPUT_LIMIT:** <value> packet(s) dropped due to virtual service bandwidth limit.
* **VS_UP:** Virtual service is UP. </value></subnet></network_name></se_name></ha_reason></se_name></se_name></se_name></vs_name></se_name></vs_name></value></previous_value></value></awaitingse_timeout></type></se_name></vs_name></type></se_name></vs_name></num_vms></vcenter></num_nws></vcenter></num_hosts></vcenter></state></vcenter></num_dcs></vcenter></num_clusters></vcenter></vcenter_name></vcenter></name></vcenter></client_ip></user_email></client_ip></user></client_ip></user></reason></vs_uuid></se_uuid></se_uuid></se_uuid></num_vs></num_se></num_se></num_se></user></days_left></port></addr></hostname></pool></port></addr></hostname></value></previous_value></sub_resource_prefix></health_monitor></port></addr></hostname></health_monitor></pool></port></addr></hostname></server_ip></nscaleout></reason></num_scaleout_servers></nscalein></reason></num_scalein_servers></mac></network_uuid></ns></mode></mask></ip></if_name></se_uuid></mac></network_uuid></ns></mode></mask></ip></if_name></se_uuid></local_mac></remote_mac></vnic_ip></vnic_name></mac></network_uuid></vnic_name></se_uuid></current_value></threshold></current_value></threshold></pool></port></addr></hostname></port></addr></hostname></pool></port></addr></hostname></current_value></threshold></current_value></threshold></current_value></threshold></value></previous_value></obj_name></vcenter></obj_name></vcenter></obj_name></vcenter></current_value></threshold></port></addr></hostname></health_monitor></port></addr></hostname></se_uuid1></se_uuid2></hb_type></current_value></threshold></current_value></threshold></current_value></threshold></ha_reason></se_name></se_name></value></previous_value></value></value></reason></se_name></network_name></vs_name></network_name></new_nw></existing_nw></vcenter></obj_name></vcenter></metrics_db_quota></current_value></current_value></current_value></current_value></vcenter></name></vcenter></ip_nw></obj_name></vcenter></se_name></se_name></se_name></network_name></vs_name></se_name></se_name></se_name></se_name></service_name></addr></addr></value></value></value></value></value></value></user></status></resource_name></resource_name></resource_name></user></status></resource_name></user></status></resource_name></user></action_name></value></vs_uuid></lifs></tenant_name></networks></lifs></contract_graphs></se_uuid></tenant_name></networks></lifs></contract_graphs></se_uuid></vs_uuid></vcenter></name></lifs></deviation></value></metric_id></vs_name></network_name></reason></vs_name></se_name></network_name>