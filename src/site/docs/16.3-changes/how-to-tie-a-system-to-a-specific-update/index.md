---
title: Locking a Linux System to a Specific OS Version
layout: default
---
### CentOS Linux

To prevent CentOS from being updated beyond some release level, it's necessary to appropriate set the $releasever parameter. Create a new file, /etc/yum/vars/releasever, containing the value of the highest point release to which an update is acceptable.

There are two ways we can do this.

<code style="font-family: Consolas;">head -n1 /etc/centos-release | awk '{print $4}' &gt; /etc/yum/vars/releasever</code>

<code style="font-family: Consolas;">echo '7.2.1511' &gt; /etc/yum/vars/releasever</code>

Some will prefer the first, as it automatically restricts to whatever release is currently running.

### Red Hat Enterprise Linux

RHEL is a bit more complicated, as there are many possible options, which are detailed here: <a href="https://access.redhat.com/solutions/238533">https://access.redhat.com/solutions/238533</a>. To summarize all but the EUS Subscription details:

### **Systems not registered to Customer Portal or Satellite**

Any of the following will work.

* Modify the <code style="font-family: Consolas;">/etc/yum.conf</code> file under the [main] heading: 

<code style="font-family: Consolas;">[main] distroverpkg=7.2</code>

* Create the var file to override $releasever: 

<code style="font-family: Consolas;">head -n1 /etc/redhat-release | awk '{print $7}' &gt; /etc/yum/vars/releasever</code>

* Alternatively ... 

<code style="font-family: Consolas;">echo '7.2' &gt; /etc/yum/vars/releasever</code>

### **Systems registered to Customer Portal or Satellite**

* See a list of possible releases: 

<code style="font-family: Consolas;">subscription-manager release --list</code>

* Set the release: 

<code style="font-family: Consolas;">subscription-manager release --set=7.2</code>

* Clean your yum cache: 

<code style="font-family: Consolas;">yum clean all</code>

* Verify the system is set to the correct release: 

<code style="font-family: Consolas;">subscription-manager release --show</code>

