---
title: Rolling Back the System
layout: layout171
---
During upgrade of Avi Vantage to a new software version, Vantage performs a snapshot of the configuration from the previous version to allow for a rollback in the case of special circumstances. The primary goal of rollback is to restore the system quickly and safely to the known configuration in the previous version.

During this procedure, all the Avi Service Engines (SEs) are rolled back simultaneously.

## Caveats

* Any updates to configuration since the upgrade will be lost after rollback
* New Service Engines created since the upgrade will not connect to the controller after rollback. These have to be manually deleted. 

## 16.2 and Later

Rollback using API/CLI is supported only if the system was already upgraded from 16.2 or later i.e the previous version should be at least 16.2.  

Example: If the system was upgraded from 16.1 to 16.2, rollback to 16.1 is not supported using this API/CLI (refer to 16.1.x section below). 
If the system was upgraded from 16.2 to later, rollback to 16.2 is supported using this API/CLI.  

### CLI

To roll back the system to a previous version, use the following command at the Vantage CLI shell prompt:

<pre><code class="language-lua">rollback system</code></pre>  

To monitor the progress of the rollback, enter the following command:

<pre><code class="language-lua">show upgrade status</code></pre>  

This command lists the steps being performed for the rollback and the progress of each step.

### API

To roll back the system, use the following command:

<pre><code class="language-lua">POST https:///api/cluster/rollback</code></pre>  

## 16.1.x

Prior to 16.2, rollback is not supported using the API.

Instead, use the following procedure:
<ol> 
 <li>Enter the following command separately on each Avi Controller node in the cluster:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">/bootstrap/install.sh --rollback</code></pre> 
  <!-- [Format Time: 0.0002 seconds] --> </li> 
 <li>Reboot each of the Avi Controller nodes in the cluster.</li> 
 <li>After reboot, verify that the cluster comes up running the previous version.</li> 
</ol> 

All Avi SEs will automatically determine that the Avi Controller is running a previous version of Vantage, and will roll back to that version.

