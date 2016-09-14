---
title: Install Avi Vantage on a Laptop with Fusion
layout: default
---
Avi Networks provides best-effort support for installing Avi Vantage (the Avi Controller and Service Engine) on VMware Fusion. For basic functionality testing, such as installing on a laptop, this solution works quite well. However, for fully redundant deployments or for capacity and performance testing, Avi strongly recommends following the requirements for the chosen environment.

## Installing Vantage in VMware Fusion

This section lists the minimum system requirements, and provides the shell commands for installing Vantage onto VMware Fusion.

### Requirements

* **Hardware:** VMware Fusion 7 or a VMware workstation with 4 CPU cores, 12 GB RAM, and a NAT-capable NIC.
* **Software:** Ubuntu server image 15.04-15.10; <a href="https://www.docker.com/">Docker</a> (to obtain the Vantage image).

### Installation Steps

From a Ubuntu virtual machine (VM) with Internet access:

1. Install Ubuntu server image 15.04-15.10 on Vmware Fusion 7 or a VMware workstation.
1. Log into the Ubuntu bash shell, and enter **sudo passwd root** to set up the root password.
1. Switch to root by typing **su –**, and enter the root password created in the previous step.
1. Run **wget** as root: **wget -qO- https://s3-us-west-1.amazonaws.com/avi-tm/avi_install | sh**