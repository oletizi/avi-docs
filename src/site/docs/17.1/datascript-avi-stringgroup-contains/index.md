---
title: DataScript&#58; avi&#46;stringgroup&#46;contains
layout: layout171
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>         
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.stringgroup.contains ( stringgroup, string )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>String groups are simple lists of string data.  This functions evaluates a custom string to see if it exists within an entry of a string group.  If the string group has been configured as a key/value pair mapping, the string is compared to see if it matches a key, and will return the string from the key's value field.<p></p> <p>The string comparison returns true upon the shortest match. If the string group has entries for a, ab, abc, and the evaluated string is 'abcdef', the function will match the 'a' since it is the shortest valid match.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>stringgroup </em></strong>is the name of the String Group to make the comparison against.  The string group must be mapped to the DataScript in the DataScript creation of the GUI or API.<p></p> <p><strong><em>string</em> </strong>is the custom data to search for within the string group</p> <p><strong><em>CASE</em></strong> - By default, the comparison is performed as case insensitive.  In order to perform the case as sensitive, use the following syntax:  avi.http.stringgroup.contains_CASE( "stringgroup", "string")</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>One or two variables may be returned from this function, depending on the type of string group referenced.<p></p> <p><strong><em>value</em> </strong>If the string group is configured for key value pair the <em>string</em> parameter is compared against the key, and the value is returned in the <em>value</em> variable.  If the string group is not configured for key value pair the value variable will be nil.</p> <p><strong><em>match</em> </strong>returns true if a match was found, or nil if no match.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Version</strong></span></td>
<td>v16.3 and later</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Related</strong></span></td>
<td><a href="/docs/17.1/datascript-avi-ipgroup-contains/">avi.ipgroup.contains()</a><strong><em> </em></strong>Matches an IP address against an IP group.<br> <a href="/docs/17.1/datascript-string-beginswith/">avi.stringgroup.beginswith()</a><strong><em> </em></strong>Matches if a string group entry begins with part of another string<br> <a href="/docs/17.1/datascript-string-endswith/">avi.stringgroup.endswith()</a><strong><em> </em></strong>Matches if a string group entry ends with part of another string<br> <a href="/docs/17.1/datascript-avi-stringgroup-equals/">avi.stringgroup.equals()</a><strong><em> </em></strong>Matches if a string group entry equals another string.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>The following example must be used with a string group configured with key value pair enabled.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">client = avi.http.get_header("Authorization")
val, match = avi.stringgroup.contains("StringGroup", client)
if match then
   avi.vs.log("User " .. val .. "authorized.")
else
   -- Deny users not in the whitelist
   avi.http.response(403)
end</code></pre> 
<!-- [Format Time: 0.0011 seconds] --></td>
</tr>
</tbody>
</table> 