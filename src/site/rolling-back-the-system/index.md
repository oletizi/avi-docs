---
title: Rolling Back the System
layout: default
---
During upgrade of Avi Vantage to a new software version, Vantage performs a snapshot of the configuration from the previous version to allow for a rollback in the case of special circumstances. The primary goal of rollback is to restore the system quickly and safely to the known configuration in the previous version.

During this procedure, all the Avi Service Engines (SEs) are rolled back simultaneously.

## 16.2 and Later

Rollback using API/CLI is supported only if the system was already upgraded from 16.2 or later i.e the previous version should be at least 16.2.

Example: If the system was upgraded from 16.1 to 16.2, rollback to 16.1 is not supported using this API/CLI (refer to 16.1.x section below).
If the system was upgraded from 16.2 to later, rollback to 16.2 is supported using this API/CLI.

### CLI

To roll back the system to a previous version, use the following command at the Vantage CLI shell prompt:
rollback

1 rollback

To monitor the progress of the rollback, enter the following command:

show upgrade status

1 show upgrade status

This command lists the steps being performed for the rollback and the progress of each step.

### API

To roll back the system, use the following command:
POST https:///api/cluster/rollback

1 POST https : ///api/cluster/rollback

## 16.1.x

Prior to 16.2, rollback is not supported using the API.

Instead, use the following procedure:

1. Enter the following command separately on each Avi Controller node in the cluster:
/bootstrap/install.sh --rollback

1 / bootstrap / install . sh  -- rollback
1. Reboot each of the Avi Controller nodes in the cluster.
1. After reboot, verify that the cluster comes up running the previous version.

All Avi SEs will automatically determine that the Avi Controller is running a previous version of Vantage, and will roll back to that version.