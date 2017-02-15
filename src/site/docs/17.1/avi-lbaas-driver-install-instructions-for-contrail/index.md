---
title: Avi LBaaS Driver Install Instructions for Contrail
layout: default
---
The following details how to install Avi LBaaS driver in an OpenStack + Contrail  environment. There are two mutually exclusive modes:

a) Neutron based Avi LBaaS driver: In this mode, Avi LBaaS driver derives off Neutron and resides in neutron-server process. This mode allows multiple Neutron LBaaS providers to co-exist.

b) Contrail based Avi LBaaS driver. In this mode, Avi LBaaS driver derives off Contrail and resides in service-monitor process. This mode allows multiple Contrail LBaaS providers to co-exist.

The Avi Vantage Cloud configuration is exactly the same in both modes. Note that in a Contrail environment, you cannot have a mix of Contrail LBaaS and Neutron LBaaS; and thus must pick a mode that is compatible with the current environment.

### Avi LBaaS Neutron Driver Install Instructions for Contrail

The following steps are to be performed on Neutron-server host.

1. Determine Contrail plugin version:

<pre><code class="language-lua">$ contrail-version neutron-plugin-contrail
Package Version
-------------------------------------
neutron-plugin-contrail 3.0.2.0-51</code></pre>  

2. Adjust <code>neutron.conf</code> database connection URL:

<pre><code class="language-lua">$ vi /etc/neutron/neutron.conf
# if using mysql
connection = mysql+pymysql://neutron:c0ntrail123@127.0.0.1/neutron</code></pre>  

3. Populate/upgrade Neutron database schema:

<pre><code class="language-lua"># to upgrade to head
$ neutron-db-manage upgrade head
# to upgrade to a specific version
$ neutron‐db‐manage ‐‐config‐file /etc/neutron/neutron.conf upgrade liberty</code></pre>  

4. Drop foreign key constraints:

<pre><code class="language-lua"># obtain current mysql token
$ cat /etc/contrail/mysql.token
fabe17d9dd5ae798f7ea

$ mysql -u root -p
Enter password: fabe17d9dd5ae798f7ea

mysql&gt; use neutron;

mysql&gt; show create table vips;
# CONSTRAINT `vips_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) - ports table is not used by Contrail
mysql&gt; alter table vips drop FOREIGN KEY vips_ibfk_1;

mysql&gt; show create table lbaas_loadbalancers;
# CONSTRAINT `fk_lbaas_loadbalancers_ports_id` FOREIGN KEY (`vip_port_id`) REFERENCES `ports` (`id`)
mysql&gt; alter table lbaas_loadbalancers drop FOREIGN KEY fk_lbaas_loadbalancers_ports_id;</code></pre>  

5. Continue with steps from README file for the Avi LBaaS plugin installation.

5.a. For a local install:

<pre><code class="language-lua"># LBaaS v1 driver
$ ./install.sh ‐‐aname avi_adc ‐‐aip &lt;CONTROLLER_IP|CONTROLLER_VIP&gt; ‐‐auser &lt;avi‐admin‐tenant‐user&gt; ‐‐apass &lt;avi‐admin‐tenant‐password&gt;

# LBaaS v2 driver
$ ./install.sh ‐‐aname avi_adc_v2 ‐‐aip &lt;CONTROLLER_IP|CONTROLLER_VIP&gt; ‐‐auser &lt;avi‐admin‐tenant‐user&gt; ‐‐apass &lt;avi‐admin‐tenant‐password&gt; --v2</code></pre>  

5.b. For manual steps:

<pre><code class="language-lua"># LBaaS v1 driver
$ vi /etc/neutron/neutron.conf
#service_plugins = neutron_plugin_contrail.plugins.opencontrail.loadbalancer.plugin.LoadBalancerPlugin
service_plugins = neutron_lbaas.services.loadbalancer.plugin.LoadBalancerPlugin
[service_providers]
service_provider = LOADBALANCER:Avi_ADC:neutron_lbaas.services.loadbalancer.drivers.avi.avi_driver.AviLbaaSDriver

[avi_adc]
address=10.1.11.4
user=admin
password=avi123
cloud=jcos

# LBaaS v2 driver
$ vi /etc/neutron/neutron.conf
#service_plugins = neutron_plugin_contrail.plugins.opencontrail.loadbalancer.plugin.LoadBalancerPlugin
service_plugins = neutron_lbaas.services.loadbalancer.plugin.LoadBalancerPluginv2
[service_providers]
service_provider = LOADBALANCERV2:avi_adc_v2:neutron_lbaas.drivers.avi.driver.AviDriver

[avi_adc_v2]
controller_ip=10.1.11.3
username=admin
password=avi123

$ service neutron-server restart
$ neutron service-provider-list</code></pre>  

### Avi LBaaS Contrail Driver Install Instructions for Contrail

These steps are exclusive with Neutron-LBaaS mode and thus any changes from that mode would need to be undone apriori. The following steps are to be performed on Neutron-server/Contrail <code>api-server</code> host.

1. Determine Contrail-plugin version:

<pre><code class="language-lua">$ contrail-version neutron-plugin-contrail
Package Version
------------------------- ------------
neutron-plugin-contrail 3.0.2.0-51</code></pre>  

2. Driver installation:

<pre><code class="language-lua"># LBaaS v2 driver
$ ./install.sh ‐‐aname ocavi_adc_v2 ‐‐aip &lt;CONTROLLER_IP|CONTROLLER_VIP&gt; ‐‐auser &lt;avi‐admin‐tenant‐user&gt; ‐‐apass &lt;avi‐admin‐tenant‐password&gt; --v2 --no-restart --no-confmodify</code></pre>  

3. Setup service-appliance-set:

<pre><code class="language-lua">$ /opt/contrail/utils/service_appliance_set.py --api_server_ip 10.10.10.100 --api_server_port 8082 --oper add --admin_user admin --admin_password contrail123 --admin_tenant_name admin --name ocavi_adc_v2 --driver "neutron_lbaas.drivers.avi.avi_ocdriver.OpencontrailAviLoadbalancerDriver" --properties '{"address": "10.1.11.3", "user": "admin", "password": "avi123", "cloud": "Default-Cloud"}'</code></pre>  

NOTE: In the event that 'neutron_lbaas' doesnt exist on the api-server node, the driver path should be adjusted to the correct path spec.

4. Delete service-appliance-set:

<pre><code class="language-lua">$ /opt/contrail/utils/service_appliance_set.py --api_server_ip 10.10.10.100 --api_server_port 8082 --oper del --admin_user admin --admin_password contrail123 --admin_tenant_name admin --name ocavi_adc_v2</code></pre>  

### Avi Controller Configuration

1. If OpenStack endpoints are private IPs and Contrail provides a public/frontend IP to those endpoints, then use iptables to DNAT.

<pre><code class="language-lua"># on AviController only - perform iptable nat to reach the private IPs.
$ iptables -t nat -I OUTPUT --dest 172.16.11.50 -j DNAT --to-dest 10.10.10.100</code></pre>  

2. Cloud configuration:

During cloud configuration, select the "Integration with Contrail" checkbox and provide the endpoint URL of the Contrail VNC <code>api-server</code>. The Keystone credentials from the OpenStack configuration will be used to authenticate with the <code>api-server</code> service.

/# Example configuration settings


<pre><code class="language-lua">: &gt; show cloud jcos
    +---------------------------+--------------------------------------------+
    | Field                     | Value                                      |
    +---------------------------+--------------------------------------------+
    | uuid                      | cloud-104bb7e6-a9d2-4b34-a4c5-d94be659bb91 |
    | name                      | jcos                                       |
    | vtype                     | CLOUD_OPENSTACK                            |
    | openstack_configuration   |                                            |
    |   username                | admin                                      |
    |   admin_tenant            | demo                                       |
    |   keystone_host           | 172.16.11.50                               |
    |   mgmt_network_name       | mgmtnw                                     |
    |   privilege               | WRITE_ACCESS                               |
    |   use_keystone_auth       | True                                       |
    |   region                  | RegionOne                                  |
    |   hypervisor              | KVM                                        |
    |   tenant_se               | True                                       |
    |   import_keystone_tenants | True                                       |
    |   anti_affinity           | True                                       |
    |   port_security           | False                                      |
    |   security_groups         | True                                       |
    |   allowed_address_pairs   | True                                       |
    |   free_floatingips        | True                                       |
    |   img_format              | OS_IMG_FMT_AUTO                            |
    |   use_admin_url           | True                                       |
    |   use_internal_endpoints  | False                                      |
    |   config_drive            | True                                       |
    |   insecure                | True                                       |
    |   intf_sec_ips            | False                                      |
    |   external_networks       | False                                      |
    |   neutron_rbac            | True                                       |
    |   nuage_port              | 8443                                       |
    |   contrail_endpoint       | http://10.10.10.100:8082                   |
    | apic_mode                 | False                                      |
    | dhcp_enabled              | True                                       |
    | mtu                       | 1500 bytes                                 |
    | prefer_static_routes      | False                                      |
    | enable_vip_static_routes  | False                                      |
    | license_type              | LIC_CORES                                  |
    | tenant_ref                | admin                                      |
    +---------------------------+--------------------------------------------+</code></pre>  