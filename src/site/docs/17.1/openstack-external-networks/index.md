---
title: OpenStack External Networks
layout: layout171
---
With release 16.2.2, Avi Vantage now supports using OpenStack external networks (i.e , those marked as "external=True") as VIP and/or pool networks. If these external networks have been correctly provisioned/configured, then the VIP is directly reachable from outside OpenStack without need for a floating-IP association. 

This feature is disabled by default and can be enabled as follows (currently only via the CLI):

<pre class="command-line language-bash" data-prompt=": >" data-output="2-99"><code>configure cloud Default-Cloud
cloud&gt; openstack_configuration
cloud:openstack_configuration&gt; external_networks
cloud:openstack_configuration&gt; save
cloud&gt; save</code></pre> 