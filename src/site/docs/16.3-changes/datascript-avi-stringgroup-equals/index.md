---
title: DataScript&#58; avi&#46;stringgroup&#46;equals
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>          
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white; font-size: medium;"><b>avi.http.stringgroup.equals( stringgroup, string )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>String groups are simple lists of string data.  This function evaluates a custom string to see if it exactly matches an entry in the string group.  If the string group has been configured as a key/value pair mapping, the string is compared to see if it matches a key, and will return the key's value field.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>stringgroup </em></strong>is the name of the string group to make the comparison against.  The string group must be mapped to the DataScript in the DataScript creation of the GUI or API.<p></p> <p><strong><em>string</em> </strong>is the custom data to search for within the string group.</p> <p><strong><em>CASE</em></strong> - By default, the comparison is performed as case insensitive.  To perform the case as sensitive, use the following syntax:  avi.http.stringgroup.endswith_CASE( "stringgroup", "string")</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>One or two variables may be returned from this function, depending on the type of string group referenced.<p></p> <p><strong><em>value</em> </strong>If the string group is configured for key value pair the <em>string</em> parameter is compared against the key, and the value is returned in the <em>value</em> variable.  If the string group is not configured for key value pair, the value variable will be nil.</p> <p><strong><em>match</em> </strong>returns true if a match was found, or false if no match.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Version</strong></span></td>
<td>v16.3 and later</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Related</strong></span></td>
<td><a href="/datascript-avi-ipgroup-contains/">avi.ipgroup.contains()</a><strong><em> </em></strong>Matches an IP address against an IP group.<br> <a href="/datascript-avi-stringgroup-contains/">avi.stringgroup.contains()</a><strong><em> </em></strong>Matches if a string group entry contains part of another string.<br> <a href="/datascript-string-beginswith/">avi.stringgroup.beginswith()</a><strong><em> </em></strong>Matches if a string group entry begins with part of another string.<br> <a href="/datascript-string-endswith/">avi.stringgroup.endswith()</a><strong><em> </em></strong>Matches if a string group entry ends with part of another string.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 1</strong></span></td>
<td>The following example checks if the userID is in an approved list before allowing access to the site.<p></p> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">match = avi.stringgroup.equals("StringGroup", avi.http.get_userid())
if not match then
   avi.http.redirect("https://login.site.com")
end</code></pre> 
<!-- [Format Time: 0.0006 seconds] --> <p> </p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 2</strong></span></td>
<td>This example redirects clients based on location embedded into the host header by moving the location into the beginning of the path.  The following table illustrates the key / values stored in the string group<p></p> 
<table border="1"> 
 <tbody> 
  <tr> 
   <td>key</td> 
   <td>value</td> 
  </tr> 
  <tr> 
   <td>us.test.com</td> 
   <td>/us</td> 
  </tr> 
  <tr> 
   <td>eu.test.com</td> 
   <td>/eu</td> 
  </tr> 
  <tr> 
   <td>ap.test.com</td> 
   <td>/ap</td> 
  </tr> 
  <tr> 
   <td>sa.test.com</td> 
   <td>/sa</td> 
  </tr> 
 </tbody> 
</table> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">val, match = avi.stringgroup.equals("StringGroup", avi.http.hostname())
if match then
   avi.http.redirect("https://www.test.com" .. val .. avi.http.get_url())
end</code></pre> 
<!-- [Format Time: 0.0009 seconds] --> <i>sa.test.com/path/index.htm?query=1</i> will be redirected to <i>www.test.com/sa/path/index.htm?query=1</i></td>
</tr>
</tbody>
</table> 