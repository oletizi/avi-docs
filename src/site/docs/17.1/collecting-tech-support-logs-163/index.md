---
title: Collecting Tech Support Logs
layout: layout171
---
Tech support logs can be very beneficial for offline troubleshooting. This article describes how to collect tech support logs from a single Avi Controller or 3-node Avi Controller cluster.

Note: In a 3-node Avi Controller cluster, the commands shown below automatically collect logs from all 3 nodes. The commands do not need to be entered separately on each Avi Controller node.

## UI

Navigate to Administration > Troubleshoot to reveal the screen shown below. Click on the Generate button to cause a core dump archive to be created.

<a href="img/Screen-Shot-2016-09-19-at-12.29.15-PM.png"><img class="aligncenter wp-image-18197" src="img/Screen-Shot-2016-09-19-at-12.29.15-PM.png" alt="Screen Shot 2016-09-19 at 12.29.15 PM" width="600" height="249"></a>

Clicking on the plus sign (appearing at the rightmost position in the archive row) causes additional information to be displayed.

<a href="img/Screen-Shot-2016-09-19-at-12.29.43-PM.png"><img class="alignnone size-full wp-image-18195" src="img/Screen-Shot-2016-09-19-at-12.29.43-PM.png" alt="Screen Shot 2016-09-19 at 12.29.43 PM" width="1000" height="796"></a>

Download the .tar.gz file and then convey it to Avi Support.

## CLI

The following command collects the debug logs on each of the Avi Controller nodes. This option keeps the collected tech support bundle to a minimal size. The option is especially useful if the core archive bundles that are present have already been uploaded and fixed.


<pre><code class="language-lua">show tech-support debuglogs</code></pre>  The following command includes the collection of the core archive bundles. 

<pre><code class="language-lua">show tech-support debuglogs filter include_archive</code></pre>  If you have external connectivity to AWS S3 from the Avi Controller, you can upload the tech support information to the Avi customer support S3 bucket, using the following command: 

<pre><code class="language-lua">upload tech-support debuglogs</code></pre>  

## API

Use the following REST API commands to collect tech support information.


<pre><code class="language-lua">GET https:///api/techsupport/debuglogs
GET https:///api/techsupport/debuglogs?include_archive=true
GET https:///api/techsupport/debuglogs?upload=true</code></pre>  