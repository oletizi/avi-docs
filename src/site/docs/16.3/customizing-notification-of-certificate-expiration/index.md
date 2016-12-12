---
title: Customizing Notification of Certificate Expiration
layout: default
---
Starting with 16.3, Avi Vantage enables users to customize when SSL certificate expiry notification is triggered. The system expects a minimum of 3 notification days. By default, the alerts are triggered 30 days, 7 days and 1 day before expiry.

### Example

In the below sequence,
<ol> 
 <ol> 
  <li>The Controller's properties are first displayed.</li> 
  <li>Two notification periods (45 days and 14 days) are specified, and</li> 
  <li>Saved into the configuration,</li> 
  <li>At which point the revised Controller properties are displayed as confirmation.</li> 
 </ol> 
</ol> 

Note that the two dates are automatically inserted and displayed in sequence.

<code>[admin:10-10-26-52]: &gt; configure controller properties</code>
<code>Updating an existing object. Currently, the object is:</code>

<code>+-----------------------------------------+---------+</code>
<code>| Field                                   | Value   |</code>
<code>+-----------------------------------------+---------+</code>
<code>| uuid                                    | global  |</code>
<code>| unresponsive_se_reboot                  | 300     |</code>
<code>| crashed_se_reboot                       | 900     |</code>
<code>| se_offline_del                          | 172000  |</code>
<code>| vs_se_create_fail                       | 1500    |</code>
<code>| vs_se_vnic_fail                         | 300     |</code>
<code>| vs_se_bootup_fail                       | 300     |</code>
<code>| se_vnic_cooldown                        | 120     |</code>
<code>| vs_se_vnic_ip_fail                      | 120     |</code>
<code>| fatal_error_lease_time                  | 120     |</code>
<code>| upgrade_lease_time                      | 360     |</code>
<code>| query_host_fail                         | 180     |</code>
<code>| vnic_op_fail_time                       | 180     |</code>
<code>| dns_refresh_period                      | 60      |</code>
<code>| se_create_timeout                       | 900     |</code>
<code>| max_dead_se_in_grp                      | 1       |</code>
<code>| dead_se_detection_timer                 | 360     |</code>
<code>| api_idle_timeout                        | 15      |</code>
<code>| allow_unauthenticated_nodes             | False   |</code>
<code>| cluster_ip_gratuitous_arp_period        | 60      |</code>
<code>| vs_key_rotate_period                    | 60      |</code>
<code>| secure_channel_controller_token_timeout | 60      |</code>
<code>| secure_channel_se_token_timeout         | 60      |</code>
<code>| max_seq_vnic_failures                   | 3       |</code>
<code>| vs_awaiting_se_timeout                  | 60      |</code>
<code>| vs_apic_scaleout_timeout                | 360     |</code>
<code>| secure_channel_cleanup_timeout          | 60      |</code>
<code>| attach_ip_retry_interval                | 360     |</code>
<code>| attach_ip_retry_limit                   | 4       |</code>
<code>| persistence_key_rotate_period           | 60      |</code>
<code>| allow_unauthenticated_apis              | False   |</code>
<code>| warmstart_se_reconnect_wait_time        | 300     |</code>
<code>| vs_se_ping_fail                         | 60      |</code>
<code>| se_failover_attempt_interval            | 300     |</code>
<code>| max_pcap_per_tenant                     | 4       |</code>
<code>| ssl_certificate_expiry_warning_days[1]  | 30 days |</code>
<code>| ssl_certificate_expiry_warning_days[2]  | 7 days  |</code>
<code>| ssl_certificate_expiry_warning_days[3]  | 1 days  |</code>
<code>| seupgrade_fabric_pool_size              | 20      |</code>
<code>| seupgrade_segroup_min_dead_timeout      | 360     |</code>
<code>+-----------------------------------------+---------+</code>

<code>[admin:10-10-26-52]: controllerproperties&gt; ssl_certificate_expiry_warning_days 45</code>
<code>[admin:10-10-26-52]: controllerproperties&gt; ssl_certificate_expiry_warning_days 14</code>
<code>[admin:10-10-26-52]: controllerproperties&gt; save</code>

<code>+-----------------------------------------+---------+</code>
<code>| Field                                   | Value   |</code>
<code>+-----------------------------------------+---------+</code>
<code>| uuid                                    | global  |</code>
<code>| unresponsive_se_reboot                  | 300     |</code>
<code>| crashed_se_reboot                       | 900     |</code>
<code>| se_offline_del                          | 172000  |</code>
<code>| vs_se_create_fail                       | 1500    |</code>
<code>| vs_se_vnic_fail                         | 300     |</code>
<code>| vs_se_bootup_fail                       | 300     |</code>
<code>| se_vnic_cooldown                        | 120     |</code>
<code>| vs_se_vnic_ip_fail                      | 120     |</code>
<code>| fatal_error_lease_time                  | 120     |</code>
<code>| upgrade_lease_time                      | 360     |</code>
<code>| query_host_fail                         | 180     |</code>
<code>| vnic_op_fail_time                       | 180     |</code>
<code>| dns_refresh_period                      | 60      |</code>
<code>| se_create_timeout                       | 900     |</code>
<code>| max_dead_se_in_grp                      | 1       |</code>
<code>| dead_se_detection_timer                 | 360     |</code>
<code>| api_idle_timeout                        | 15      |</code>
<code>| allow_unauthenticated_nodes             | False   |</code>
<code>| cluster_ip_gratuitous_arp_period        | 60      |</code>
<code>| vs_key_rotate_period                    | 60      |</code>
<code>| secure_channel_controller_token_timeout | 60      |</code>
<code>| secure_channel_se_token_timeout         | 60      |</code>
<code>| max_seq_vnic_failures                   | 3       |</code>
<code>| vs_awaiting_se_timeout                  | 60      |</code>
<code>| vs_apic_scaleout_timeout                | 360     |</code>
<code>| secure_channel_cleanup_timeout          | 60      |</code>
<code>| attach_ip_retry_interval                | 360     |</code>
<code>| attach_ip_retry_limit                   | 4       |</code>
<code>| persistence_key_rotate_period           | 60      |</code>
<code>| allow_unauthenticated_apis              | False   |</code>
<code>| warmstart_se_reconnect_wait_time        | 300     |</code>
<code>| vs_se_ping_fail                         | 60      |</code>
<code>| se_failover_attempt_interval            | 300     |</code>
<code>| max_pcap_per_tenant                     | 4       |</code>
<code>| ssl_certificate_expiry_warning_days[1]  | 45 days |</code>
<code>| ssl_certificate_expiry_warning_days[2]  | 30 days |</code>
<code>| ssl_certificate_expiry_warning_days[3]  | 14 days |</code>
<code>| ssl_certificate_expiry_warning_days[4]  | 7 days  |</code>
<code>| ssl_certificate_expiry_warning_days[5]  | 1 days  |</code>
<code>| seupgrade_fabric_pool_size              | 20      |</code>
<code>| seupgrade_segroup_min_dead_timeout      | 360     |</code>
<code>+-----------------------------------------+---------+</code>

 

To undo any of the warning_days entries, execute a sequence such as the below within the configure command:

<code>[admin:10-10-26-52]: controllerproperties&gt; no ssl_certificate_expiry_warning_days 14</code>
<code>[admin:10-10-26-52]: controllerproperties&gt; no ssl_certificate_expiry_warning_days 1</code>
<code>[admin:10-10-26-52]: controllerproperties&gt; save</code>

Note this restriction: Add as many warning_days entries as you like. However, when removing them, Avi Vantage will reject any attempt to reduce the number of entries below three.
