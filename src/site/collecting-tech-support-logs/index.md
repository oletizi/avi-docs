---
title: Collecting Tech Support Logs
layout: default
---
Tech support logs can be very beneficial for offline troubleshooting. This article describes how to collect tech support logs from a single Avi Controller or 3-node Avi Controller cluster.

Note: In a 3-node Avi Controller cluster, the commands shown below automatically collect logs from all 3 nodes. The commands do not need to be entered separately on each Avi Controller node.

## CLI

The following command collects the debug logs on each of the Avi Controller nodes. This option keeps the collected tech support bundle to a minimal size. The option is especially useful if the core archive bundles that are present have already been uploaded and fixed.
show tech-support debuglogs

1 show tech - support debuglogs
  The following command includes the collection of the core archive bundles.
show tech-support debuglogs filter include_archive

1 show tech - support debuglogs filter include_archive
  If you have external connectivity to AWS S3 from the Avi Controller, you can upload the tech support information to the Avi customer support S3 bucket, using the following command:
upload tech-support debuglogs

1 upload tech - support debuglogs

## API

Use the following REST API commands to collect tech support information.
GET https:///api/techsupport/debuglogs GET https:///api/techsupport/debuglogs?include_archive=true GET https:///api/techsupport/debuglogs?upload=true

1

2
3 GET https : ///api/techsupport/debuglogs

GET https : ///api/techsupport/debuglogs?include_archive=true
GET https : ///api/techsupport/debuglogs?upload=true