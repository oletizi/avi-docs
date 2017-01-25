---
title: DataScript&#58; avi&#46;ipgroup&#46;contains
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>         
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.ipgroup.contains ( ipgroup, ipaddress )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>An IP address is compared against the list of IP addresses in an IP group.  The IP group may be either a list of IP addresses, networks, or countries.<p></p> <p>The comparison returns true upon the any match. If the IP group has entries for <em>10.0.0.0/8</em>, <em>10.10.0.0/16</em>, and <em>10.10.10.10</em> and the evaluated IP address is <em>10.10.10.10</em>, the function will match successfully.</p> <p>See <a href="/docs/16.3/templates-groups-ip-group/">IP group</a> for further help on creating and using IP groups.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>ipgroup </em></strong>is the name of the IP group to make the comparison against.  The IP group must be mapped to the DataScript in the DataScript creation of the GUI or API.<p></p> <p><strong><em>ipaddress </em></strong>is a v4 IP address in dotted quad notation (<em>1.2.3.4</em>)</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td><strong><em>match</em> </strong>returns true if a match was found, or false if no match.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Version</strong></span></td>
<td>v16.3 and later</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Related</strong></span></td>
<td><a href="/docs/16.3/datascript-avi-stringgroup-contains/">avi.stringgroup.contains()</a><strong><em> </em></strong>Matches a custom string against a string group.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Discard clients matched against an IP blacklist<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = avi.vs.client_ip()
if avi.ipgroup.contains("IP-Group", var) then
   avi.vs.log("Blacklisted IP" .. var.. "attempting to log in")
   avi.http.close_conn()
end</code></pre> 
<!-- [Format Time: 0.0008 seconds] --></td>
</tr>
</tbody>
</table> 