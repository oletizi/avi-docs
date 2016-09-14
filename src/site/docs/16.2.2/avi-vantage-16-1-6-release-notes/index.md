---
title: Avi Vantage 16.1.6 Release Notes
layout: default
---
This article describes the changes and fixes in Avi Vantage release 16.1.6.

Note: For information about fixes and enhancements in earlier 16.*x* releases, see the following:

* <a href="/docs/latest/avi-vantage-16-1-5-release-notes">16.1.5 Release Notes</a>
* <a href="/docs/latest/avi-vantage-16-1-4-release-notes">16.1.4 Release Notes</a>
* <a href="/docs/latest/avi-vantage-16-1-3-release-notes">16.1.3 Release Notes</a>
* <a href="/docs/latest/avi-vantage-16-1-2-release-notes">16.1.2 Release Notes</a>
* <a href="/docs/latest/avi-vantage-16-1-1-release-notes">16.1.1 Release Notes</a> (also contains information for 16.1)

## What’s New in 16.1.6

This release contains fixes but no new features.

## Issues Resolved in 16.1.6

* AV-10642: Avi Service Engines (SEs) did not correctly handle TCP out-of-band (OOB) data.
* AV-10635: Packet buffer leak could occur when back-end UDP servers were down.
* AV-10572: Configuration change to TCP/UDP profile could cause the ending port number of the virtual service port range to be incorrectly set to 0.

## Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 15.1.5.

* <a href="/2016/03/07/upgrading-the-vantage-software/">Upgrade Instructions</a>
* <a href="/2016/02/02/protocol-ports-used-by-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a>

## Product Documentation

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### Installation Guides

* <a href="/docs/installation-guides/">Avi Vantage Installation Guides</a>

## Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>]

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>