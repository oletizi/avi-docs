---
title: System Cleanup Following Uninstall from Mesos DCOS
layout: default
---
If Avi Vantage will no longer be used in an on-premises Mesos Datacenter Operating System (DCOS) cloud, run the command string shown in the following example as ***root*** administrator on each host in the Mesos cluster. The command cleans up any persistent state information that may be left over from Vantage.

Make sure to replace the host IP (HIP) value with the IP address of the host. This example performs cleanup on host 10.10.22.102.
<pre crayon="false" class="command-line language-bash" data-output="3-100" white-space="pre"><code>sudo su
rm -rf /var/lib/controller; 
HIP="10.10.22.102"; H="avi_${HIP}-avitag-1"; systemctl stop $H ; systemctl disable $H ; rm -f /etc/systemd/system/${H}.service; 
for i in `docker images | egrep "avinetworks/controller |avinetworks/se " | awk '{print $3}'`; do docker rmi -f $i; done
</code></pre>