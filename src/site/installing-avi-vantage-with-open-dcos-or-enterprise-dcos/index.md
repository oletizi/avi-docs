---
title: Installing Avi Vantage with Open DC/OS or Enterprise DC/OS
layout: default
---
This article describes how to install Avi Vantage into an Open DC/OS or Enterprise DC/OS cloud, using DC/OS Universe.

The Avi Vantage installation package is available as part of the DC/OS Universe repository.

## Installation

Ensure the DC/OS CLI package is installed. (See a <a href="https://docs.mesosphere.com/usage/cli/">https://docs.mesosphere.com/usage/cli/</a> for instructions.)

### Using the DC/OS CLI

To view the options available during installation:
dcos package describe avi

**Example:**
<a href="img/dcos13.jpg"><img src="img/dcos13.jpg" alt="dcos13" width="1020" height="648"></a>
To begin installation:

dcos package install avi

**Example:**
<a href="img/dcos1.jpg"><img src="img/dcos1.jpg" alt="dcos1" width="922" height="100"></a>

### Advanced Installation Options

To view all configuration options:
dcos package describe avi --config --render

**Example:**
<a href="img/dcos14.jpg"><img src="img/dcos14.jpg" alt="dcos14" width="924" height="1097"></a>

### Using the DC/OS Web Interface

Select the avi-vantage installation package from the applications catalog:
<a href="img/dcos3.jpg"><img src="img/dcos3.jpg" alt="dcos3" width="1873" height="1053"></a>
For basic installation, click Install Package: <a href="img/dcos4.jpg"><img src="img/dcos4.jpg" alt="dcos4" width="375" height="413"></a>
After installation is complete, a success dialog appears: <a href="img/dcos6.jpg"><img src="img/dcos6.jpg" alt="dcos6" width="341" height="264"></a>

### Advanced Installation Options

For advanced installation, click Advanced Installation.
Enter or select option values, then click Review and Install.
<a href="img/dcos5.jpg"><img src="img/dcos5.jpg" alt="dcos5" width="719" height="591"></a>
After installation is complete, a success dialog appears: <a href="img/dcos6.jpg"><img class="alignnone size-full wp-image-9325" src="img/dcos6.jpg" alt="dcos6" width="341" height="264"></a>

## Viewing Deployment Status

To view deployment status within Marathon, see the Dashboard. In the following example, the deployment is still in progress:
<a href="img/dcos7-1.jpg"><img src="img/dcos7-1.jpg" alt="dcos7" width="992" height="525"></a>
In this example, deployment is complete and Avi Vantage is running:
<a href="img/dcos8-1.jpg"><img src="img/dcos8-1.jpg" alt="dcos8" width="1024" height="510"></a>

## Application Auto-discovery

Avi Vantage auto-discovers the applications running through Marathon, and creates a virtual service configuration for each of the applications. This example shows a set of four applications running in Marathon:
<a href="img/dcos10.jpg"><img src="img/dcos10.jpg" alt="dcos10" width="1372" height="690"></a>
Vantage creates virtual service configurations for each of the applications:
<a href="img/dcos9-1.jpg"><img src="img/dcos9-1.jpg" alt="dcos9" width="861" height="409"></a>
Likewise, when a new application is added to Marathon, Vantage auto-discovers the new application and creates a virtual service configuration for it. In this example, a new application called "webapp1" is added in Marathon:
<a href="img/dcos11-1.jpg"><img src="img/dcos11-1.jpg" alt="dcos11" width="1904" height="613"></a>
Vantage discovers the new applications and creates a virtual service configuration for it:
<a href="img/dcos12-1.jpg"><img src="img/dcos12-1.jpg" alt="dcos12" width="1919" height="314"></a>

## Uninstalling

If Vantage needs to be uninstalled, use the following CLI command.

Note: Package un-installation is currently available only via the DC/OS CLI.
dcos package uninstall avi

**Example:**
<a href="img/dcos2.jpg"><img src="img/dcos2.jpg" alt="dcos2" width="836" height="68"></a>

Note: Also <a href="/system-cleanup-following-uninstall-from-mesos-dcos/">click here</a> for post-uninstall cleanup instructions.