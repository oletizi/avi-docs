---
title: OpenStack/AWS - Forcing Deletion of Virtual Service Ports in Neutron
layout: default
---
In OpenStack or Amazon Web Services (AWS) clouds, when a virtual service is deleted from Avi Vantage, the port associated with the VIP of the virtual service also is deleted. However, the ports associated with the pool networks of the virtual service are not immediately deleted. Instead, they are removed as part of a garbage collection process.

In 15.x and 16.1-16.1.5, the garbage collection process can take anywhere from 5 to 20 minutes. In 16.1.6 and higher, the process can take about 15 minutes.

To force faster deletion of the ports, the following CLI command or API request can be used.

### CLI

To force faster deletion of the ports, the following CLI command can be used:
<pre class="command-line language-bash" data-prompt=": >" data-output="2-99"><code>exec cloud <em>cloud-name</em> gc force
 </code></pre>

The command will need to be run 3 or 4 times. The first time the command is run the ports are marked for deletion. The ports are then deleted upon subsequent runs of the command.

API

To force faster deletion of the unneeded ports, use the following API request:
<pre>
PUT /api/cloud/<em>cloud-uuid</em>/gc?force=True
</pre>

Example:

<pre>
PUT /api/cloud/cloud-bbd20bcf-ebf5-4d2b-b521-9c3f0c369df0/gc?force=True
</pre>