---
title: Avi Vantage 16.1.2 Release Notes
layout: default
---
This article describes the new features, changes, and fixes in Avi Vantage release 16.1.2.

Note: For information about fixes and enhancements in 16.1.1 or 16.1, <a href="/docs/16.3/avi-vantage-16-1-1-release-notes">click here</a>.

## What’s New in 16.1.2

No new features are added in this maintenance release.

## Issues Resolved in 16.1.2

* AV-8761 APIC: Use of Avi Vantage Service Graphs across VRFs was not supported.
* AV-8718 Mesos: Setting the A/B pool ratio caused task restart and service disruption. This occurred when labels were used. Vantage 16.1.2 supports using the API to set the A/B ratio for Mesos.
* AV-8717 APIC: VIPs are registered as part of the Device Selection Policy for the APIC DSR feature.
* AV-8709 Vantage did not support TCP SYNs in which the Explicit Congestion Notification (ECN) or Congestion Window Reduced (CWR) features were enabled. SYNs in which either the ECN or CWR option was enabled were dropped.
* AV-8701 OpenStack: If the management session was switched to a non-admin tenant, private SE group flavors did not appear in the SE group edit window.
* AV-8614 Web interface: If the advanced workflow (Create Virtual Service &gt; Advanced Setup) was used to create a virtual service for an OpenStack or AWS cloud, the configuration failed.
* AV-8496 Upgrade: If the pool down action for a pool was set to local response, upgrade from a previous version to 16.1.x would fail. If this occurred, the following exception (error) message was generated: Enum POOL_DOWN_HTTP_STATUS_CODE_503 not found in enum type FailHttpStatusCode 