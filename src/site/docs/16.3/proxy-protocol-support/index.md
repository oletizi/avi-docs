---
title: PROXY Protocol Support
layout: 16.3
---
By default, Avi Service Engines (SEs) source-NAT (SNAT) traffic destined to servers. Due to SNAT, logs on the application servers will show the layer 3 IP address of the SE rather than the original client’s IP address. Protocol extensions such as <a href="/docs/16.3/x-forwarded-for-header-insertion/">“X-Forwarded-For” header for HTTP</a> require knowledge of the underlying protocol (such as HTTP). For layer 4 applications, Avi Vantage supports versions 1 (human-readable format) and version 2 (binary format) of the PROXY protocol (<a href="http://www.haproxy.org/download/1.5/doc/proxy-protocol.txt">PROXY protocol spec</a>), which conveys the original connection parameters, such as the client IP address, to the back-end servers. For layer 4 SSL applications, version 1 is supported. The Avi SE requires no knowledge of the encapsulated protocol. The impact on performance caused by processing of transported information is very minimal.

PROXY protocol spec format:

<pre pre="" class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100"><code>PROXY TCP4 (<em>real source address</em>) (<em>proxy address</em>) (<em>TCP source port</em>) (<em>TCP destination port</em>) (<em>CRLF sequence</em>)</code></pre> 

Example V1 PROXY protocol line:

<pre pre="" class="command-line language-bash"><code>PROXY TCP4 12.97.16.194 136.179.21.69 31646 80\r\n
</code></pre> 

### Application Support

Applications must be written to grab the IP address embedded within the PROXY header embedded in the TCP options.  See the <a href="http://www.haproxy.org/download/1.5/doc/proxy-protocol.txt">PROXY protocol spec</a> for documentation to add this capability to an application.

### Configuring PROXY Protocol via UI

<ol> 
 <li>Navigate to Template &gt; Profiles.</li> 
 <li>Within the Application tab, select System-L4-Application.</li> 
 <li>For Type, select L4, as shown below.</li> 
 <li>Click Enable PROXY Protocol.</li> 
 <li>Select which version is desired.</li> 
 <li>When finished changing the profile, click Save.</li> 
</ol> 

The profile change affects any virtual services that use the same L4 application profile.

<a href="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png"><img class="alignnone wp-image-11123" src="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png" alt="Screen Shot 2016-07-18 at 11.10.53 AM" width="600" height="337"></a>

 

### Configuring PROXY Protocol via CLI

The following sequence of CLI commands enable PROXY protocol support and protocol version to be used.

<table class="table table-hover table table-bordered table-hover">  
<tbody>  
<tr>  
<td><span style="font-weight: 400;">: &gt; </span><b>configure applicationprofile System-L4-Application</b><p></p> <p><span style="font-weight: 400;">: applicationprofile&gt; </span><b>tcp_app_profile</b></p> <p><span style="font-weight: 400;">: applicationprofile:tcp_app_profile&gt; </span><b>proxy_protocol_enabled</b></p> <p><span style="font-weight: 400;">: applicationprofile:tcp_app_profile&gt; </span><b>proxy_protocol_version proxy_protocol_version_1</b></p> <p><span style="font-weight: 400;">: applicationprofile:tcp_app_profile&gt; </span><b>save</b></p> <p><span style="font-weight: 400;">: applicationprofile&gt; </span><b>save</b></p></td>
</tr>
</tbody>
</table> 