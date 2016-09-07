---
title: Installing Avi Vantage on Bare Metal
layout: default
---
This article describes how to install Avi Vantage on a bare-metal infrastructure.

Avi Vantage is a software-based solution that provides real-time analytics and elastic application delivery services, including user-to-application timing, SSL termination, and load balancing. Installing Avi Vantage onto bare-metal servers directly leverages the raw horsepower of the underlying hardware without the overhead added by the virtualization layer. The Avi Vantage bare-metal solution uses containerization provided by Docker for support across operating systems and for easy installation.

## Deployment Topologies

Avi Vantage can be deployed onto bare-metal servers in the following topologies. The number of bare-metal servers required for deployment depends on the deployment topology.
Deployment Topology Bare-metal Servers Required Description Single host 1 Avi Controller and SE both run on a single host. Separate hosts 2 Avi Controller and SE run on separate hosts. The Controller is deployed on one of the hosts. The SE is deployed on the other host. 3-node cluster 3 Provides high availability for the Controller.

A single instance of the Controller is deployed on each host. At any given time, one of the Controllers is the leader and the other 2 are followers.

### Single-host Deployment

Single-host deployment runs the Controller and SE on the same bare-metal server. This is the simplest topology to deploy. However, this topology does not provide High Availability for the Controller or SE.

<a href="img/bare-metal-topo-1noderevised-2.png"><img src="img/bare-metal-topo-1noderevised-2.png" alt="bare-metal-topo-1noderevised" width="338" height="304"></a>

### Two-host Deployment

Two-host deployment runs the Controller on one bare-metal server and the SE on another bare-metal server.

<a href="img/bare-metal-topo-2noderevised.png"><img src="img/bare-metal-topo-2noderevised.png" alt="bare-metal-topo-2noderevised" width="675" height="299"></a>

### Three-host Cluster Deployment

Three-host deployment requires a separate instance of the Controller on each of 3 bare-metal servers.

<a href="img/bare-metal-topo-3noderevised-1.png"><img src="img/bare-metal-topo-3noderevised-1.png" alt="bare-metal-topo-3noderevised" width="675" height="623"></a>

In a 3-node cluster deployment, one of the Controller instances is the leader. The other 2 instances are followers. If the leader goes down, one of the followers takes over so that service to end-users is continued.

## Deployment Prerequisites

This section lists the minimum requirements for installation.

### Hardware Requirements

Each bare-metal server on which you plan to install and run Avi Vantage must meet at least the following physical requirements:
Component Minimum Requirement CPU Intel Xeon with 8 cores Memory 16 GB RAM Hard Drive (HD) 64 GB Network Interface Controller (NIC) 1 x 1 Gbps (Intel NIC 82598 or 82599 controller family)

### Software Requirements

Bare-metal deployment of Avi Vantage also requires the following software:
Software Version Avi Vantage (distributed by Avi Networks as Docker image) 15.3 Docker (image management service that runs on Linux) 1.6.0 Operating System (OS) One of the following:
Oracle Enterprise Linux 7.0, 7.1, or 7.2
Red Hat Enterprise Linux 7.0

## Installation

Avi Vantage deployment onto bare metal requires the following procedure:

1. Install the Docker platform (if not already installed).
1. Install Avi Controller and SE images onto host.
1. Use the setup wizard to perform initial configuration of the Controller.
1. Deploy the SE.

Detailed steps are provided below.

### Install Docker

Avi Vantage for bare-metal servers is distributed as a Docker image. If Docker is not already installed in your network, use the applicable steps to install it. If deploying onto multiple hosts, repeat the applicable installation procedure on each host.

### Install Docker onto Oracle Enterprise Linux

1. Install updates to Oracle Linux (OEL): 
yum update
1. Download and install the latest version of Docker: 
wget –q0- https://get.docker.yom/ | sh
1. Start Docker services: 
sudo service docker start
1. If deploying on more than one host, repeat the steps above on each host.

### Install Docker onto Red Hat Linux

1. Register the bare-metal host with Red Hat: 
subscription-manager register
1. Enable the repository for extra services: 
subscription-manager --enable=rhel-7-server-extras-rpms
1. Install updates to Red Hat: 
sudo yum update
1. Install Docker: 
sudo yum install docker
1. Start Docker services: 
sudo service docker start
1. If deploying on more than one host, repeat the steps above on each host.

### Verify Docker Installation and Version

Enter the **docker version** command to verify the Docker version that is installed and running. In this example, the version is 1.8.1.:
docker version Client: Version: 1.8.1 API version: 1.20 Go version: go1.4.2 Git commit: d12ea79 Built: Thu Aug 13 02:35:49 UTC 2015 OS/Arch: linux/amd64 Server: Version: 1.8.1 API version: 1.20 Go version: go1.4.2 Git commit: d12ea79 Built: Thu Aug 13 02:35:49 UTC 2015 OS/Arch: linux/amd64

## Install Avi Controller Image

1. Use SCP to copy the .tgz package onto the bare-metal node that will host the Avi Controller: 
scp docker_install.tar.gz root@Host-IP:/tmp/
1. Use SSH to log into the host: 
ssh root@Host-IP
1. Change to the /tmp directory: 
cd /tmp/
1. Unzip the .tgz package: 
sudo tar -xvf docker_install.tar.gz

1. Run the setup.py script. The script will display prompts for a series of questions. For the yes/no questions, enter "y". For the questions about resource allocation, enter the amounts for your deployment. The script also prompts for the Controller's IP address. 
./avi_baremetal_setup.py Welcome to AVI Initialization Script DPDK Mode: Pre-requisites(DPDK): This script assumes the below utilities are installed: docker, make, gcc, kernel-headers (yum -y install docker gcc make \ kernel-uek-devel-'uname -r' kernel-uek-headers-'uname -r') Supported Nics(DPDK): Intel 82599/82598 Series of Ethernet Controllers Supported Vers(DPDK): Oracle Linux 7.0, 7.1, 7.2 Non-DPDK Mode: Pre-requisites: This script assumes the below utilities are installed: docker (yum -y install docker) Supported Vers: Oracle Linux 7.0, 7.1, 7.2; RHEL 7.0 Caution : This script deletes existing AVI docker containers & images. Do you want to proceed in DPDK Mode [y/n] y Do you want to run AVI Controller on this Host [y/n] y Do you want to run AVI SE on this Host [y] y Enter The Number Of Cores For AVI Controller. Range [4, 31] 4 Please Enter Memory (in GB) for AVI Controller. Range [12, 124] 12 Enter The Number Of Cores For AVI Service Engine. Range [1, 28] Please Enter Memory (in MB) for AVI Service Engine. Range [28672, 116378] Please Enter Controller IP 10.10.10.10 Disabling AVI Services... Removing Existing AVI SE Docker Images. Please Wait.. Loading AVI SE Image. Please Wait.. Removing Existing AVI CONTROLLER Docker Images. Please Wait.. Loading AVI CONTROLLER Image. Please Wait.. Compiling DPDK kernel.core_pattern = /var/crash/%e.%p.%t.core Installation Successful. Reboot At A Convenient Time

1. Reboot the host to complete installation: 
reboot
1. If deploying a 3-node cluster, repeat the steps above on the hosts for each of the other 2 Controllers.

## Perform Initial Controller Setup

1. Use a web browser to navigate to the Avi Controller and start the setup wizard.
1. Create an administrator account: <a href="img/bare-metal-ctlrdeploy-admin-2.png"><img src="img/bare-metal-ctlrdeploy-admin-2.png" alt="bare-metal-ctlrdeploy-admin" width="236" height="292"></a>
1. Enter DNS server and NTP server information: <a href="img/bare-metal-ctlrdeploy-dnsntp-2.png"><img src="img/bare-metal-ctlrdeploy-dnsntp-2.png" alt="bare-metal-ctlrdeploy-dnsntp" width="236" height="311"></a>
1. Choose No Orchestrator as your infrastructure: <a href="img/bare-metal-ctlrdeploy-infra-2.png"><img src="img/bare-metal-ctlrdeploy-infra-2.png" alt="bare-metal-ctlrdeploy-infra" width="236" height="329"></a>
1. In the Support Multiple Tenants window, click No: <a href="img/bare-metal-ctlrdeploy-tenant-2.png"><img src="img/bare-metal-ctlrdeploy-tenant-2.png" alt="bare-metal-ctlrdeploy-tenant" width="236" height="170"></a>

## Deploy Service Engine

1. Use SCP to copy the .tgz package onto the bare-metal node that will host the SE: 
scp docker_install.tar.gz root@Host-IP:/tmp/
1. Use SSH to log into the host: 
ssh root@Host-IP
1. Change to the /tmp directory: 
cd /tmp/
1. Unzip the .tgz package: 
sudo tar -xvf docker_install.tar.gz

1. Run the setup.py script. The script will display prompts for a series of questions. Use the same answers as used for the Controller. (For the yes/no questions, enter "y". For the questions about resource allocation, enter the amounts for your deployment. The script also prompts for the Controller's IP address.) 
./avi_baremetal_setup.py Welcome to AVI Initialization Script DPDK Mode: Pre-requisites(DPDK): This script assumes the below utilities are installed: docker, make, gcc, kernel-headers (yum -y install docker gcc make \ kernel-uek-devel-'uname -r' kernel-uek-headers-'uname -r') Supported Nics(DPDK): Intel 82599/82598 Series of Ethernet Controllers Supported Vers(DPDK): Oracle Linux 7.0, 7.1, 7.2 Non-DPDK Mode: Pre-requisites: This script assumes the below utilities are installed: docker (yum -y install docker) Supported Vers: Oracle Linux 7.0, 7.1, 7.2; RHEL 7.0 Caution : This script deletes existing AVI docker containers & images. Do you want to proceed in DPDK Mode [y/n] y Do you want to run AVI Controller on this Host [y/n] n Do you want to run AVI SE on this Host [y] y Enter The Number Of Cores For AVI Service Engine. Range [1, 28] Please Enter Memory (in MB) for AVI Service Engine. Range [28672, 116378] Please Enter Controller IP: 10.10.10.10 Disabling AVI Services... Removing Existing AVI SE Docker Images. Please Wait.. Loading AVI SE Image. Please Wait.. Compiling DPDK kernel.core_pattern = /var/crash/%e.%p.%t.core Installation Successful. Reboot At A Convenient Time

1. Reboot the host to complete installation: 
reboot