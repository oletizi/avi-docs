---
title: Enable a Virtual Service VIP on All Interfaces
layout: default
---
Typically, a virtual service is placed on one or more NICs, as determined by a list ascertained by the Avi Controller. However, the list may not include all SE interfaces. This feature enables placing the VIP on all NICs of the SEs in the SE group. This is especially useful when using the default gateway feature, wherein the back-end servers otherwise might never be able to reach the VIP placed on interfaces other than one set as their default gateway.

**CLI Configuration**

The configuration knob [<code>enable_vip_on_all_interfaces</code>] is a Service Engine group property, and is disabled by default. The configuration knob is relevant only if the IP-routing/default gateway feature is enabled. In addition, the configuration of this knob [<code>enable-to-disable / disable-to-enable</code>], is applicable only when all affected virtual services have first been disabled.
