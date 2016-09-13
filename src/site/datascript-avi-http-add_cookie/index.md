---
title: DataScript&#58; avi.http.add_cookie
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.add_cookie( table )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Insert a new cookie or cookies into the HTTP request or response. If the cookie already exists, Vantage will append the specified value or flags to the existing cookie.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600">A table of cookie name-value pairs for HTTP request contex) and optionally additional cookie attribute value pairs such as path, domain, etc for HTTP response.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Request Parameter</strong></font> </td> 
   <td width="600">HTTP Request event:  The cookie name value pairs are added in the Cookie header of the HTTP request, and if no such header exists then the Cookie header is added.<p></p> <p><em>avi.http.add_cookie( name1, value1 [, name2, value2] )</em></p> <p><strong><em>name</em></strong> is the name of the new cookie.<br> <strong><em>value</em></strong> is the value or data field of the new cookie.</p> <p>In the HTTP request context, all arguments are treated as cookie name value pairs, i.e. the function ignores cookie attributes such as "Domain", "Path", etc. and will treat them as another cookie to be added.</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Response Parameter</strong></font> </td> 
   <td width="600">HTTP Response event:  When called in an HTTP response context, the cookie name value pairs are added in the Set-Cookie header of the HTTP response. If no such header exists the Set-Cookie header is created.<p></p> <p>In the HTTP response context, only the first two arguments are treated as cookie name value pairs and the subsequent arguments are interpreted as cookie attributes such as Domain",  "Path", etc. and their corresponding values.</p> <p><em>avi.http.add_cookie( name, value, path, domain, expires, max-age, httponly, secure )</em></p> <p><em><strong>name</strong></em> is the name of the new cookie.<br> <strong><em>value</em></strong> is the value or data field of the new cookie.<br> <strong><em>path</em></strong> is the value (a string) of the path attribute<br> <strong><em>domain</em></strong> is the value (a string) of the domain attribute<br> <strong><em>expires</em></strong> is the value (an integer) of the expires attribute<br> <strong><em>max-age</em></strong> is the value (an integer) of the max-age attribute<br> <strong><em>httponly</em></strong> is the value (a boolean) of the httponly attribute<br> <strong><em>secure</em></strong> is the value (a boolean) of the secure attribute</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">None</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>HTTP Request Example</strong></font> </td> 
   <td width="600">Example method 1:  Add two cookies: jsessionid=123 and lang=en<p></p> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cookie_table = {jsessionid="123", lang="en"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "lang", "en" ) cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "/", "www.avinetworks.com" ) avi.http.add_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})</code></pre> 
    <!-- [Format Time: 0.0023 seconds] --> <p> Example method 2:  Add two cookies: jsessionid=123 and lang=en</p> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cookie_table = {jsessionid="123", lang="en"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "lang", "en" ) cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "/", "www.avinetworks.com" ) avi.http.add_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})</code></pre> 
    <!-- [Format Time: 0.0014 seconds] --> <p> </p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>HTTP Response Example</strong></font> </td> 
   <td width="600">Example 1:  Add the cookie jsessionid with value 123, and attributes of path=/ and domain=www.avinetworks.com to produce the following header in the HTTP response:<p></p> <p>Set-Cookie: jsessionid=123; path=/; domain=www.avinetworks.com<br> 
     <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">cookie_table = {jsessionid="123", lang="en"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "lang", "en" ) cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "/", "www.avinetworks.com" ) avi.http.add_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})</code></pre> 
    <!-- [Format Time: 0.0017 seconds] --> <span style="font-weight: 400;">Example 2:  In this format, the order matters. The third argument must be path, fourth must be domain, fifth must be expires, sixth must be max-age, seventh must be httponly flag and the eighth must be secure flag.<br> 
     <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cookie_table = {jsessionid="123", lang="en"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "lang", "en" ) cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "/", "www.avinetworks.com" ) avi.http.add_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})</code></pre> 
     <!-- [Format Time: 0.0010 seconds] --> <span style="font-weight: 400;">If expires and max-age attributes are not desired, values 0 are passed as argument.<br> 
      <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cookie_table = {jsessionid="123", lang="en"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "lang", "en" ) cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"}
avi.http.add_cookie( cookie_table ) avi.http.add_cookie( "jsessionid", "123", "/", "www.avinetworks.com" ) avi.http.add_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})</code></pre> 
      <!-- [Format Time: 0.0019 seconds] --> </span></span></td> 
  </tr> 
 </tbody> 
</table>