---
title: Reset an OpenStack Default Cloud
layout: default
---
### When and Why To Reset Default-Cloud

The first cloud environment configured in Avi Vantage is named "Default-Cloud". This article describes how to properly remove and reset the configured default cloud ("Default-Cloud") from Avi Vantage when the default cloud is OpenStack.

When creating a new cloud connector in Vantage, a number of objects are created to support the configuration, both on the Avi Controller and in some cases in the target cloud environment (OpenStack, VMware vCenter, AWS, etc).

For a non-default cloud, it is possible to simply delete the entire cloud ***once it is no longer in use***. This delete triggers a cleanup in the cloud environment of related objects. For example, deleting a custom OpenStack cloud connector deletes all Service Engines, Neutron security groups, Nova anti-affinity groups, Neutron ports, and glance images in OpenStack that were created as part of Vantage installation and operation.

Since Vantage's default cloud cannot be deleted, this creates challenges to cleaning up OpenStack objects when removing Vantage from OpenStack. It can be converted to no access mode, but this leaves all objects in the cloud intact for manual control.

To remove the OpenStack cloud connector for the default cloud, use the following steps.

### Steps for Resetting the Default Cloud

<ol> 
 <li>Delete all virtual services and pools from the cloud. The cloud cannot be deleted if it still contains any of these resources.</li> 
 <li>Connect to the Avi Controller through SSH or the console.</li> 
 <li>Connect to the CLI shell: <strong>shell</strong></li> 
 <li>Run this command: <strong>exec cloud Default-Cloud gc force cleanup</strong></li> 
 <li>Exit the shell.</li> 
</ol> 