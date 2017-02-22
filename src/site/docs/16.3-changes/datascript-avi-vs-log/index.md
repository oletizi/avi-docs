---
title: DataScript&#58; avi&#46;vs&#46;log
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.log()</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Generate a log associated with the connection or request and viewed within the Virtual Service &gt; Client Log page. A log field is created called datascript_log, containing the DataScript’s name and the output of the avi.vs.log command. If avi.vs.log is called multiple times, the output of each invocation goes in the same datascript_log field in the client log.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>Logs may contain any arbitrary combination of string, number, Boolean and nil values.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>None</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td> From DataScript "Log1" HTTP_REQ event:<br> 
<!-- Crayon Syntax Highlighter v_2.7.2_beta --> <pre><code class="language-lua">avi.vs.log("Hello World!")</code></pre> 
<!-- [Format Time: 0.0003 seconds] --> From DataScript "Log2" HTTP_RESP event:<br> 
<!-- Crayon Syntax Highlighter v_2.7.2_beta --> <pre><code class="language-lua">num = 2
avi.vs.log("Hello " .. num .. " You!")</code></pre> 
<!-- [Format Time: 0.0004 seconds] --> Output from the client log:<p></p> <pre crayon="false" class="">DataScript Log: [string "Log1"]:1: Hello World!

DataScript Log: [string "Log2"]:1: Hello 2 You!</pre> <p>Note: The logs are prefixed by meta information, which is generally the function name and line number calling <strong>avi.vs.log()</strong>. When the call is not made from a function, the name is the name of the script (in our example, the script is a <strong>string</strong>, not a file, named Log1).</p></td>
</tr>
</tbody>
</table> 