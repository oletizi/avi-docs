---
title: How to tie a system to a specific update
layout: layout163
---
## CentOS Linux

On CentOS we can tie the system down to a specific update by changing the $releasever value. To do this we will need to create a new file in /etc/yum/vars/ with the var we want to replace. In this case we will create a /etc/yum/vars/releasever on the system.

There are two ways we can do this.

* <code style="font-family: Consolas;">head -n1 /etc/centos-release | awk '{print $4}' &gt; /etc/yum/vars/releasever</code> or

* <code style="font-family: Consolas;">echo '7.2.1511' &gt; /etc/yum/vars/releasever</code> 

Personally, I prefer the first as it will lock you down to whatever you have running.

## Red Hat Enterprise Linux

RHEL is a tad bit more complicating as there are many possible options. Which are detailed here: <a href="https://access.redhat.com/solutions/238533">https://access.redhat.com/solutions/238533</a> . But I will summarize them for you excluding the EUS Subscription details.

**For systems not registered to Customer Portal or Satellite:**
Using any of these will work.

* We can modify the <code style="font-family: Consolas;">/etc/yum.conf</code> file under the [main] heading. 
<code style="font-family: Consolas;">[main] distroverpkg=7.2</code>
* By creating the var file to override releasever  
    * <code style="font-family: Consolas;">head -n1 /etc/redhat-release | awk '{print $7}' &gt; /etc/yum/vars/releasever</code>
* Alternatively  
    * <code style="font-family: Consolas;">echo '7.2' &gt; /etc/yum/vars/releasever</code> 

**For systems registered to Customer Portal or Satellite:**

* To see a list of possible releases 
<code style="font-family: Consolas;">subscription-manager release --list</code>
* Set the release 
<code style="font-family: Consolas;">subscription-manager release --set=7.2</code>
* Clean your yum cache 
<code style="font-family: Consolas;">yum clean all</code>
* Verify the system is set to the correct release 
<code style="font-family: Consolas;">subscription-manager release --show</code> 