---
title: Avi GSLB Site Configuration and Operations
layout: default
---
### Avi GSLB Sites

As mentioned in <a href="/docs/16.3/gslb-architecture-and-object-model/">Avi GSLB Architecture</a>, GSLB sites fall into two broad categories — **Avi sites** and **external sites** (e.g., running third-party ADCs from vendors such as F5, Citrix, etc.). This article focuses on Avi sites.

Each Avi site is characterized as either **active** or a **passive**. Active sites synchronize the GSLB site configuration among themselves. They also query all Avi sites to ascertain the health of those sites. Passive sites host local virtual services, but do not host any GSLB service configuration. Neither do passive sites monitor the health of other sites.

Active sites are further classified into two types — **GSLB leader **and **f****ollowers**. Exactly one of the active sites — the one from which the initial GSLB site configuration is performed, is designated as the GSLB leader. GSLB site configuration changes are permitted only on the leader. The only way to switch the leader is by overriding the configuration of the leader from a follower site. This override can be invoked in the case of site failures or for maintenance.

Centralized analytics are only available from the GSLB leader site. Localized metrics and logs are available for the DNS services hosting the GSLB records.

<a href="img/ActivePassiveSite-1.png"><img class="alignnone size-full wp-image-16815" src="img/ActivePassiveSite-1.png" alt="Active/Passive Site" width="1312" height="535"></a>

In the above example, Santa Clara, Chicago, and NY-1 are active sites, as indicated by the orange oval around the Controller icons. Boston, Austin and NY-2 are passive sites, as the grey ovals depict. Santa Clara is the GSLB leader; all others are followers.

### Failure Scenarios

Avi Vantage's behavior after a failure in a GSLB deployment will vary depending on whether the failure is 
<ol> 
 <li>At a leader site or one of the followers, and</li> 
 <li>Of the entire site or just the Avi Controller.</li> 
</ol> 

### Follower Site Failures

A full-site failure at the NY follower site is depicted below.

<a href="img/site-failure-handling.png"><img class="aligncenter wp-image-17698" src="img/site-failure-handling.png" alt="Follower site failure handling" width="800" height="279"></a>

 
<ol> 
 <li><span style="font-weight: 400;">The leader and Chicago Controllers detect the failure.</span></li> 
 <li><span style="font-weight: 400;">Administrative changes to the GSLB configuration continue to be possible on the leader, but they will not make it to the NY site. Central analytics continue to be accessible, albeit without any contribution from NY.</span></li> 
 <li><span style="font-weight: 400;">Both control-plane and data-plane health monitors will mark NY's GS members DOWN. [Read more about control- and data-plane health in <a href="/docs/16.3/avi-gslb-service-and-health-monitors/">Avi GSLB Sergice and Health Monitors</a>.)</span></li> 
 <li>Global application service will continue on the two surviving sites.</li> 
</ol> 

If only the Avi Controller at the NY site fails, 

<ol> 
 <li>The leader and Chicago Controllers detect the failure via their control-plane monitors. Central analytics continue to be accessible, albeit without any contribution from NY.</li> 
 <li>Any administrative changes made on the leader will not make it to the NY site.</li> 
 <li>Data-plane health monitors running in Santa Clara and Chicago will continue to perceive NY's members as UP.</li> 
 <li>Global application service will continue on all three sites.</li> 
</ol> 

### Follower Site Recovery

<ol> 
 <li>The leader Controller detects connectivity to the follower Controller at NY. The latest configuration will be pushed to it.</li> 
 <li>Other active sites will likewise detect successful connectivity to the NY follower Controller as a result of their control-plane health monitors.</li> 
 <li>If the data-plane never went down, no more need be done.</li> 
 <li>If data-plane monitors for NY's GS members had been configured and previously marked NY's GS members as DOWN, NY's members will be marked UP and traffic to them will resume only after those data-plane monitors once again perceive good health.</li> 
</ol> 

### Leader Site Failures

A full-site failure at the Santa Clara leader site is depicted below .

<a href="img/leader_site_failure.png"><img class="aligncenter wp-image-21814" src="img/leader_site_failure.png" alt="Avi GSLB leader site failure" width="800" height="289"></a>

<ol> 
 <li><span style="font-weight: 400;">As they are active sites, both Chicago and NY detect the failure.</span></li> 
 <li><span style="font-weight: 400;">No administrative changes to the GSLB configuration can be made. There is no access to central analytics.</span></li> 
 <li><span style="font-weight: 400;">Both control-plane and data-plane health monitors will mark Santa Clara's GS members DOWN.</span></li> 
 <li>Global application service will continue on the two surviving sites.</li> 
</ol> 

If only the leader Avi Controller at the Santa Clara site fails, 

<ol> 
 <li>As they are active sites, both Chicago and NY detect the Controller failure via their control-plane health monitors.</li> 
 <li><span style="font-weight: 400;">No administrative changes to the GSLB configuration can be made. There is no access to central analytics.</span></li> 
 <li>Data-plane health monitors running in Chicago and NY will continue to perceive Santa Clara's members as UP.</li> 
 <li>Global application service will continue on all three sites.</li> 
</ol> 

### Leader Site Change

In neither of the above leader-site failure scenarios is a new leader designated; there is no automatic re-election process involved. This is an optional and manual operation that can be performed at any active follower site, either to restore the ability to lead, or for the sake of site maintenance. Both Chicago and NY qualify as potential leaders. From either the steps would be:
<ol> 
 <li>A GSLB admin logs into the follower Controller and commands it to become the new leader. Until it becomes the leader it is the so-called "leader-designate."</li> 
 <li>A take-over message is propagated to all other Avi sites, apprising them of the change in command.</li> 
 <li>Should the prior leader (Santa Clara) come back up, it assumes the role of a follower as a result of the take-over message that had been queued for transmission during its downtime.</li> 
</ol> 

 

<a href="img/change-gslb-leader.png"><img class="size-full wp-image-17701 aligncenter" src="img/change-gslb-leader.png" alt="Change gslb leader" width="851" height="285"></a>

### Network Partitioning

Network partitioning (a kind of "split brain") occurs due to failures or outages in the Internet or VPN infrastructure between the sites. In case of network failure, each site updates the GS member state based on control-plane and data-plane health monitors. Both parts of the network act as independent and exclusive subnetworks.

<a href="img/network-partitioning.png"><img class="size-full wp-image-17704 aligncenter" src="img/network-partitioning.png" alt="Network partitioning" width="868" height="303"></a>

Hence, each site responds to DNS queries using only the members to which it has connectivity. In the above example, DNS queries to Santa Clara would be resolved to steer clients to vip-1, while DNS queries to Chicago or NY would steer clients to either vip-3 or vip-6.

Santa Clara remains the leader during the network outage, notwithstanding its inaccessibility to access the other two Avi sites. No new leader is automatically elected on the other network partition.

### Configuration of GSLB Sites

****1. Set up the individual Avi Controller clusters****

Create two or more Controller clusters (two in this example), and run through the initial system configuration steps. In the below scenario the two Controllers will be Santa Clara (10.10.25.10) and Boston (10.160.0.20). Each of the Controller clusters could be a 1-node (test & development) or a 3-node (production) cluster. 

Note: For better audit trails, the recommended practice is to set up an admin user account for GSLB configuration. Create a user named ‘gslb’ and assign it admin roles in all the Controller clusters.

****2. <a></a>Configure local DNS virtual service on all active sites that host DNS****

Configure a DNS virtual service on all the clusters where the DNS service needs to be hosted, bound to the g-dns se-group.

In 16.3, the DNS virtual services need to be exclusively allocated their own Service Engine group.

Configure a new Service Engine group to host the DNS virtual service (referred to as g-dns se-group), on **both **Controller clusters. This configuration is done from Infrastructure -> Cloud -> Service Engine Group<a href="img/configure-local-DNS-5.png"><img class="aligncenter wp-image-16875" src="img/configure-local-DNS-5.png" alt="configure local DNS" width="800" height="500"></a>

In SantaClara (10.10.25.10):

Configure a DNS virtual service on all the clusters where the DNS service needs to be hosted, bound to the g-dns se-group:

Use Advanced setup:

<a href="img/advanced-configurations.png"><img class="aligncenter wp-image-16883" src="img/advanced-configurations.png" alt="advanced configurations" width="900" height="75"></a>

 

Configure a DNS virtual service.

<a href="img/advance-setup-steptwo.png"><img class="aligncenter wp-image-16886" src="img/advance-setup-steptwo.png" alt="advance setup-stepTwo" width="800" height="504"></a>

 

<a href="img/configure-local-DNS_stepTwo.png"><img class="aligncenter wp-image-16896" src="img/configure-local-DNS_stepTwo.png" alt="configure local DNS_stepTwo" width="800" height="505"></a>

 

<a href="img/configure-local-DNS_stepThree.png"><img class="aligncenter wp-image-16899" src="img/configure-local-DNS_stepThree.png" alt="configure local DNS_stepThree" width="800" height="502"></a>

 

<a href="img/configure-local-DNS_stepFour.png"><img class="aligncenter wp-image-16902" src="img/configure-local-DNS_stepFour.png" alt="configure local DNS_stepFour" width="800" height="499"></a>

 

On 10.160.0.20 (Boston):

Use Advanced setup:

<a href="img/BostonAdvancedSetup.png"><img class="aligncenter wp-image-16905" src="img/BostonAdvancedSetup.png" alt="Boston Advanced Setup" width="900" height="75"></a>

Configure a DNS virtual service.

<a href="img/configure-local-DNS_Boston.png"><img class="aligncenter wp-image-16908" src="img/configure-local-DNS_Boston.png" alt="configure local DNS_Boston" width="800" height="271"></a>

 

Go through the next 3 tabs (Rules, Analytics, Advanced), and save the virtual service.

****3. Configure local application virtual services****

Create application virtual services normally. For example, create an HTTP virtual service vs-1 in Controller cluster 1, and virtual-service vs-2 in Controller cluster 2.

See <a href="/docs/16.3/architectural-overview/applications/virtual-services/">Configuring Virtual Services</a> for more details: 

On 10.10.25.10 (Santa Clara):

<a href="img/localApplicationVS-1.png"><img class="size-full wp-image-16913 aligncenter" src="img/localApplicationVS-1.png" alt="local Application VS-1 Santa Clara" width="503" height="198"></a>

On 10.160.0.20 (Boston):

<a href="img/localApplicationVS-2.png"><img class="size-full wp-image-16916 aligncenter" src="img/localApplicationVS-2.png" alt="localApplicationVS-2 Boston" width="510" height="200"></a>

 

****4. Designate the GSLB leader Controller, and add site configuration****

Choose one of the Controller clusters as the leader, and perform GSLB configuration on this Controller. In the sample topology, the Santa Clara site (10.10.25.10) is chosen as the GSLB leader.
<ol> 
 <li><span style="font-weight: 400;">Go to Infrastructure -&gt; GSLB</span> <a href="img/GSLB_one.png"><img class="aligncenter wp-image-16922" src="img/GSLB_one.png" alt="GSLB_one" width="900" height="137"></a></li> 
 <li><span style="font-weight: 400;">Edit and create the GSLB leader site</span><a href="img/GSLB_two.png"><img class="size-full wp-image-16924 aligncenter" src="img/GSLB_two.png" alt="GSLB_two" width="696" height="751"></a>After successful configuration, the following screen appears. In the Type column, "Owner" should be interpreted as "Leader."<a href="img/GSLB_three.png"><img class="aligncenter wp-image-16926" src="img/GSLB_three.png" alt="GSLB_three" width="900" height="195"></a></li> 
 <li><span style="font-weight: 400;">Add the second site by clicking ‘Add New’</span></li> 
</ol> 

<a href="img/GSLB_four.png"><img class="size-full wp-image-16928 aligncenter" src="img/GSLB_four.png" alt="GSLB_four" width="756" height="508"></a>

 

Use the checkbox to indicate if the site is an active or a passive site.

For sites that do not have a DNS virtual service, press ‘Save’ to save the site configuration.

For sites that have a DNS virtual service, press ‘Save and Set DNS Virtual Services’:

 

<a href="img/Save-and-Set-DNS-Virtual-Services.png"><img class="size-full wp-image-17664 aligncenter" src="img/Save-and-Set-DNS-Virtual-Services.png" alt="Save and Set DNS Virtual Services" width="721" height="599"></a>

 

<a href="img/Save-and-Set-DNS-Virtual-Services2.png"><img class="aligncenter wp-image-17670" src="img/Save-and-Set-DNS-Virtual-Services2.png" alt="Save and Set DNS Virtual Services2" width="900" height="278"></a>

 

At this point, the two sites are talking to each other, and configuration synchronization is enabled.

### Site Configuration Errors

Errors in site configuration — ip-address, credentials, and the like — show up when the site information is saved. Some sample error screens follow.

Authentication failure

<a href="img/Authentication-failed.png"><img class="aligncenter wp-image-17672" src="img/Authentication-failed.png" alt="Authentication failed" width="800" height="308"></a>

 

Max retry login failure

<a href="img/MaxRetryError.png"><img class="aligncenter wp-image-17678" src="img/MaxRetryError.png" alt="MaxRetryError" width="800" height="339"></a>

 

HTTP 400 error

<a href="img/http-error.png"><img class="aligncenter wp-image-17682" src="img/http-error.png" alt="HTTP 400 error" width="800" height="329"></a>

 

### Validating the GSLB Configuration

In the secondary site (Boston), check the GSLB page, and make sure that the site configuration shows up.

<a href="https://10.160.0.20/#/authenticated/administration/gslb"><span style="font-weight: 400;">https://10.160.0.20/#/authenticated/administration/gslb</span></a>

<a href="img/GSLB-validation.png"><img class="aligncenter wp-image-17685" src="img/GSLB-validation.png" alt="GSLB validation" width="800" height="279"></a>
<ol start="5"> 
 <li><b> Configure routes to make sure that the DNS virtual service has accessibility to local virtual services</b></li> 
</ol> 

The DNS Service Engine monitors the health of the GSLB service members. Add static routes (or default gateway) to make sure that the members are reachable.

<a href="img/local-vs.png"><img class="size-full wp-image-17688 aligncenter" src="img/local-vs.png" alt="local vs" width="1532" height="296"></a>

For example, on 10.10.25.10 (Santa Clara):

<a href="img/Santa-Clara-static-route.png"><img class="size-full wp-image-17690 aligncenter" src="img/Santa-Clara-static-route.png" alt="Santa Clara static route" width="590" height="237"></a>

On 10.160.0.20 (Boston):

<a href="img/Boston-settings.png"><img class="size-full wp-image-17693 aligncenter" src="img/Boston-settings.png" alt="Boston settings" width="615" height="158"></a>

 

### CLI-Based Configuration

 

****1. Set up the Controller clusters****

**Current limitations:**

- All member Controller clusters have to be set up completely, before starting any GSLB configuration. If GSLB configuration is made, and a new Controller is added, the configuration is not [yet] synced to the new Controller.

****2. Designate GSLB leader Controller, and create global configuration****

Create GSLB global configuration:

Example: two Controller clusters (10.10.25.10 and 10.160.0.25)

10.10.25.10 is the designated GSLB leader. So, create the configuration in the GSLB leader.

Find the cluster uuids of both Controller clusters.

On 10.10.25.10:

<pre><code class="language-lua">: &gt; show cluster

+---------------+----------------------------------------------+
| Field         | Value                                        |
+---------------+----------------------------------------------+
| uuid          | cluster-42301dd3-0529-ada4-ec02-69a2c593df6d |
: &gt; configure gslb glb
: gslb&gt; dns_configs
New object being created

: gslb:dns_configs&gt; domain_name avi.com
: gslb:dns_configs&gt;
: gslb&gt; site_controller_clusters
New object being created

: gslb:site_controller_clusters&gt; ip_addresses 10.10.25.10
: gslb:site_controller_clusters&gt; cluster_uuid cluster-42301dd3-0529-ada4-ec02-69a2c593df6d
: gslb:site_controller_clusters&gt; username admin
: gslb:site_controller_clusters&gt; password admin
: gslb:site_controller_clusters&gt; name SantaClara
: gslb:site_controller_cluster&gt; save
: gslb&gt; site_controller_clusters
New object being created

: gslb:site_controller_clusters&gt; ip_addresses 10.160.0.20
: gslb:site_controller_clusters&gt; cluster_uuid cluster-42215c91-6280-6016-31f6-7416a1f4c4ad
: gslb:site_controller_clusters&gt; username admin
: gslb:site_controller_clusters&gt; password admin
: gslb:site_controller_clusters&gt; name Boston
: gslb:site_controller_clusters&gt; save
: gslb&gt; save
+------------------------------+-----------------------------------------------+
| Field                        | Value                                         |
+------------------------------+-----------------------------------------------+
| uuid                         | gslb-cafe8f98-c411-47cd-96d2-1a6d4e3bad74 |
| name                         | glb                                           |
| dns_configs[1]               |                                               |
|   domain_name                | avi.com                                       |
| site_controller_clusters[1]  |                                               |
|   cluster_ref                | cluster-42301dd3-0529-ada4-ec02-69a2c593df6d  |
|   name                       | SantaClara                                    |
|   ip_addresses[1]            | 10.10.25.10                                   |
|   port                       | 443                                           |
|   username                   | admin                                         |
| site_controller_clusters[2]  |                                               |
|   cluster_ref                | cluster-42215c91-6280-6016-31f6-7416a1f4c4ad  |
|   name                       | Boston                                        |
|   ip_addresses[1]            | 10.160.0.20                                   |
|   port                       | 443                                           |
|   username                   | admin                                         |
| owner_controller_cluster_ref | cluster-42301dd3-0529-ada4-ec02-69a2c593df6d  |
| tenant_ref                   | admin                                         |
+------------------------------+-----------------------------------------------+
: &gt;</code></pre>  

Now, the synchronization is set up. 

**Validation**

Go to the secondary site, and try the show command. The UUIDs will match across GSLB leader and follower.

<pre><code class="language-lua">: &gt; show gslb
+------+-----------------------------------------------+
| Name | UUID                                          |
+------+-----------------------------------------------+
| glb  | gslb-cafe8f98-c411-47cd-96d2-1a6d4e3bad74 |
+------+-----------------------------------------------+</code></pre>    

****3. Configure local DNS virtual service****

 

Configure a new SE group to host the DNS virtual service (referred to as g-dns se-group), on both Controller clusters.

Configure a DNS virtual service on all the clusters where the DNS service is hosted, bound to the g-dns SE group:

* ****Configure domain names hosted by the DNS virtual service (optional)**** 

From the CLI, create an application profile that selects the domain names hosted by this virtual service (on all Controller clusters).

<pre><code class="language-lua">: &gt; configure applicationprofile dns
: applicationprofile&gt; type application_profile_type_dns
: applicationprofile&gt; dns_service_profile
: applicationprofile:dns_service_profile&gt; domain_names avi.com
: applicationprofile:dns_service_profile&gt; save
: applicationprofile&gt; save</code></pre>  

From the UI or CLI, create an application profile that selects the domain names hosted by this virtual service.

**4. Configure local application virtual services**

Create application virtual services normally. For example, create an HTTP virtual service vs-1 in Controller cluster 1, and virtual-service vs-2 in Controller cluster 2.

See <a href="/docs/configuration-guide/applications/virtual-services/">Configuring Virtual Services</a> for more details.

**5. Configure health monitor for GSLB Services**

Only on the GSLB leader (Santa Clara / 10.10.25.10):

<pre><code class="language-lua">: &gt; configure globalhealthmonitor global-http-hm
: globalhealthmonitor&gt; type health_monitor_http
: globalhealthmonitor&gt; monitor_port 80
: globalhealthmonitor&gt; save</code></pre>  **6. Configure routes to make sure that DNS virtual service has access to local virtual services** 

The DNS Service Engine monitors the health of the GSLB service members. Add static routes (or default gateway) to make sure that the members are reachable.

For example, on 10.10.25.10 (Santa Clara):

<pre><code class="language-lua">: &gt; configure vrfcontext global
Updating an existing object. Currently, the object is:

+----------------+-------------------------------------------------+
| Field          | Value                                           |
+----------------+-------------------------------------------------+
| uuid           | vrfcontext-fde3b826-b19c-449c-8dec-ddeb119f2498 |
| name           | global                                          |
| system_default | True                                            |
| tenant_ref     | admin                                           |
| cloud_ref      | Default-Cloud                                   |
+----------------+-------------------------------------------------+
: vrfcontext&gt; static_routes
: vrfcontext:static_routes&gt; prefix 10.0.0.0/8 next_hop 10.90.12.1
: vrfcontext:static_routes&gt; save
: vrfcontext&gt; save

+------------------+-------------------------------------------------+
| Field            | Value                                           |
+------------------+-------------------------------------------------+
| uuid             | vrfcontext-fde3b826-b19c-449c-8dec-ddeb119f2498 |
| name             | global                                          |
| static_routes[1] |                                                 |
|   prefix         | 10.0.0.0/8                                      |
|   next_hop       | 10.90.12.1                                      |
|   route_id       | 1                                               |
| system_default   | True                                            |
| tenant_ref       | admin                                           |
| cloud_ref        | Default-Cloud                                   |
+------------------+-------------------------------------------------+
: &gt;</code></pre>  On 10.160.0.20 (Boston): 

**7. Configure GSLB services**

<pre><code class="language-lua">: &gt; configure globalservice view
: globalservice&gt; domain_names view.avi.com
: globalservice&gt; health_monitor_refs global-http-hm
: globalservice&gt; num_dns_ip 1
: globalservice&gt; groups
New object being created

: globalservice:groups&gt; algorithm gslb_algorithm_round_robin
: globalservice:groups&gt; name active-sc
: globalservice:groups&gt; priority 10
: globalservice:groups&gt; members
New object being created

: globalservice:groups:members&gt; ip 10.90.12.100
: globalservice:groups:members&gt; save
: globalservice:groups&gt; save
: globalservice&gt; groups
: globalservice:groups:members&gt; ip 10.160.110.200
: globalservice:groups:members&gt; save
: globalservice:groups&gt; save
: globalservice&gt; save
+----------------------------------+----------------------------------------------------+
| Field                            | Value                                              |
+----------------------------------+----------------------------------------------------+
| uuid                             | globalservice-3f359566-f534-47d9-a735-10105fa53bfb |
| name                             | view                                               |
| domain_names[1]                  | view.avi.com                                       |
| groups[1]                        |                                                    |
|   name                           | active-sc                                          |
|   priority                       | 10                                                 |
|   algorithm                      | GSLB_ALGORITHM_ROUND_ROBIN                         |
|   members[1]                     |                                                    |
|     ip                           | 10.90.12.100                                       |
|     ratio                        | 1                                                  |
|     enabled                      | True                                               |
| groups[2]                        |                                                    |
|   name                           | standby-boston                                     |
|   priority                       | 7                                                  |
|   algorithm                      | GSLB_ALGORITHM_ROUND_ROBIN                         |
|   members[1]                     |                                                    |
|     ip                           | 10.160.110.200                                     |
|     ratio                        | 1                                                  |
|     enabled                      | True                                               |
| num_dns_ip                       | 1 count                                            |
| health_monitor_refs[1]           | global-http-hm                                     |
| site_persistence_type            | SITE_PERSISTENCE_NONE                              |
| site_persistence_profile_timeout | 5 mins                                             |
| tenant_ref                       | admin                                              |
+----------------------------------+----------------------------------------------------+</code></pre>  

**8. Configure pass-through server**

In case there’s an FQDN miss on a DNS virtual service, Avi can pass this request through (load-balance) to one or more backup DNS servers. To enable this, configure a pool containing these servers, and attach this to the DNS virtual service.

If a domain filter is configured in the application filter of the VS, then the pass-through is performed only for FSDNs that fall within this subdomain. All other queries are dropped.

Unsupported queries are also forwarded to the pass-through server.

* ****Configure Domain Names hosted by the DNS virtual service (optional)**** 

From the CLI, create an application profile that selects the domain names hosted by this virtual service (on all Controller clusters).

<pre><code class="language-lua">: &gt; configure applicationprofile dns
: applicationprofile&gt; type application_profile_type_dns
: applicationprofile&gt; dns_service_profile
: applicationprofile:dns_service_profile&gt; domain_names avi.com
: applicationprofile:dns_service_profile&gt; save
: applicationprofile&gt; save</code></pre>  

From the UI or CLI, create an application profile that selects the domain names hosted by this virtual service.

**9. Configure corporate/external DNS server to delegate subdomain to the Avi DNS service.**

Delegate avi.com to the Avi GSLB

To try this out in the lab, <code>dnsmasq</code> was installed on the clients, and the following entries added:

On client 1:

server=/avi.com/10.10.25.10

server=/avi.com/10.160.110.100

dig pay.avi.com ..

On client 2:

server=/avi.com/10.160.110.100

server=/avi.com/10.10.25.10

<code></code>
**10. Troubleshooting**

<pre><code class="language-lua">: &gt; show virtualservice colo-dns dnstable
Sub Domains Serviced:
avi.com
+----------------+-----+---------+-------------------------------------------------------------+---------+--------+
| FQDN           | TTL | Num-IPS | IP Addresses                                                | Service | Tenant |
+----------------+-----+---------+-------------------------------------------------------------+---------+--------+
| cloud7.avi.com | 60  | 1       | de:10.40.10.10, de:10.40.10.1, be:10.40.10.3, uk:10.40.10.2 | gs-4    | admin  |
| cloud8.avi.com | 60  | 1       | de:10.40.10.10, de:10.40.10.1, be:10.40.10.3, uk:10.40.10.2 | gs-4    | admin  |
...

: &gt; show virtualservice colo-dns globalserviceruntime filter gs_uuid globalservice-c3a4785b-a722-476b-906a-6869ed7e2cae
: &gt; show virtualservice colo-dns globalserviceinternal filter gs_uuid globalservice-c3a4785b-a722-476b-906a-6869ed7e2cae
: &gt; show virtualservice colo-dns globalservicehmonstat filter gs_uuid globalservice-c3a4785b-a722-476b-906a-6869ed7e2cae</code></pre>  

Connection logs provide information about the FQDN and the response IP addresses provided in the DNS query response.

 

 
