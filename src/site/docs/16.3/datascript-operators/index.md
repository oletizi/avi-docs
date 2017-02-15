---
title: DataScript&#58; Operators
layout: layout163
---
Operators compare or contrast sets of data, and will return as *true* or *false*.  DataScripts rely on the Lua scripting language for the syntax and supported usage of arithmetic, relational and logical operators.  DataScripts are case sensitive when evaluating strings, so “a” does not equal “A”.

 

### Arithmetic Operators:

<pre class="">+                      -- Addition
-                      -- Subtraction
*                      -- Multiplication
/                      -- Division</pre> 

 

### Relational Operators:

<pre class="">&gt;                     -- Greater than
&lt;                     -- Less than
&gt;=                    -- Greater than or equal
&lt;=                    -- Less than or equal
==                    -- Equal
~=                    -- Not equal</pre> 

If the port does not equal 443, then redirect the client to HTTPS.

<pre><code class="language-lua">if avi.vs.port() ~= <strong>"</strong>443<strong>"</strong> then
   avi.http.redirect(<strong>"</strong>https://<strong>"</strong> .. avi.vs.host() .. avi.http.get_uri())
end</code></pre>  

 

### Logical Operators

<pre class="">and
or
not
string.find            -- Search for a string within another string.</pre> 

 

