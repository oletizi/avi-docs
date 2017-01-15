---
title: Avi Vantage 16.1.4 Release Notes
layout: default
---
This article describes the changes and fixes in Avi Vantage release 16.1.4.

Note: For information about fixes and enhancements in earlier 16.*x* releases, see the following:

* <a href="/docs/16.2/avi-vantage-16-1-3-release-notes">16.1.3 Release Notes</a>
* <a href="/docs/16.2/avi-vantage-16-1-2-release-notes">16.1.2 Release Notes</a>
* <a href="/docs/16.2/avi-vantage-16-1-1-release-notes">16.1.1 Release Notes</a> (also contains information for 16.1) 

## What’s New in 16.1.4

This release contains fixes but no new features.

## Issues Resolved in 16.1.4

* AV-10520: Postgres failure during Avi Controller upgrade causes the upgrade to be aborted.
* AV-10362: APIC: Logical interface (LIf) sharing did not work across Virtual Routing Frameworks (VRFs) for APIC graph instances. 

## Issues Resolved in 16.1.3

* AV-10313: When a virtual service was scaled out across two or more Avi SEs, packets could be dropped between the primary SE and the secondary SE due to maximum transmission unit (MTU) limits.
* AV-9584: Error threshold for packets with TCP window size 0 adjusted to reduce unnecessary significant logs. (Default threshold changed to a minimum of 5 events or 2% of total traffic for the virtual service.)
* AV-9579: In certain circumstances, the postgres database could fail to start on a follower Avi Controller node in a 3-node Controller cluster. This caused the configuration on the follower node to go out of sync.
* AV-9481: OpenSSL upgraded to v1.0.2h.
* AV-9319: Accept-Encoding headers for gzip packets were incorrectly rewritten.
* AV-9315: IP forwarding for the Avi Controller was unnecessarily enabled in non-container infrastructures.
* AV-9248: (OpenStack) If a project’s UUID changed (for example, because a project was recreated in Keystone), but an older tenant with the same UUID still existed in Vantage, this caused issues with logging into the newly created tenant.
* AV-9022: If an Avi SE failed to reconnect following upgrade, the upgrade could take longer.
* AV-9005: Long Certificate Revocation Lists (CRLs) could cause an Avi SE to stop working. 

## Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 15.3 or later.

* <a href="/docs/16.2/upgrading-the-vantage-software/">Upgrade Instructions</a>
* <a href="/docs/16.2/protocol-ports-used-by-avi-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a> 

## Product Documentation

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### Installation Guides

* <a href="/docs/16.2/installation-guides/">Avi Vantage Installation Guides</a> 

## Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

