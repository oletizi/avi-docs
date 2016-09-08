---
title: Determine Software Version
layout: default
---
To determine the specific Avi Vantage software version running on the Avi Controller (and its Service Engines), use either of the following methods.

### CLI

From the Controller shell, enter this command:
<pre class="">: &gt; show version controller
+-----------------+--------------------------------------+
| Controller Name | Version                              |
+-----------------+--------------------------------------+
| 10.130.162.14   | 15.2.4(9007) 2015-10-17 01:43:38 UTC |
+-----------------+--------------------------------------+</pre>

Alternatively, from bash, run this command:

**cat /bootstrap/VERSION**

### Web Interface

From the top right corner of the Controller web interface, select *user-name* > About Avi Vantage.

<img src="img/AboutMenu.png" alt="AboutMenu" width="96" height="139">

<a href="img/About.png"><img src="img/About.png" alt="About" width="315" height="235"></a>

               