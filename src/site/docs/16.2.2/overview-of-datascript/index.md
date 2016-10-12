---
title: Overview of DataScript
layout: default
---
### About

Most functionality desired from Avi Vantage can be configured directly through the GUI, CLI, or API.  However, there may be occasions where the native feature set is not robust enough to cater to a specific use case.  For this purpose Avi provides DataScript, which is a Lua-based scripting environment capable of adding significant extensibility to the Avi Vantage functionality.  DataScripts are more advanced versions of the policies, which similarly allow inspection and manipulation of client and server traffic. DataScripts can be used to inspect client HTTP requests or server HTTP responses and perform content switching, redirection, header manipulation, logging, and more.

The DataScript scripting language is built upon an embedded Lua interpreter, with additional Avi-specific libraries added to extend the power.  The basic DataScript syntax is based on Lua, with additional commands, called functions, available for Avi-specific tasks.  For in-depth help on Lua scripting syntax and usage, see <a href="http://www.lua.org">www.lua.org</a>

DataScripts are executed within the data plane on the Avi Service Engines hosting the virtual service to which the DataScript has been attached. DataScript is different than ControlScript, which is a Python-based scripting tool for automation of the control plane and executed from the Avi Controller.

A typical DataScript will typically be in some form of if / then logic, similar to a policy's match / action logic.

<pre><code class="language-lua">path = avi.http.get_path()
if string.beginswith(path, "/docs/") then
   avi.redirect("http://docs.avinetworks.com/index.html")
end</code></pre>  

 

### <img class=" wp-image-802 alignright" src="img/Pool_Down.png" alt="Pool_Down" width="269" height="211">Assigning to a Virtual Service

DataScripts are reusable objects that are maintained within: *Templates > Scripts > DataScripts*.  They are attached to a virtual service by editing a VS and navigating to: *Virtual Service Edit > Rules > DataScript* and select *New DataScript* to choose an existing DataScript or create a new one*.*  A virtual service may have multiple DataScripts.  Also, a DataScript may be used by multiple virtual services.  The exception is when a DataScript references a specific pool, such as the example shown, in which case the DataScript may only be used by one virtual service at a time.

 

### Recommended Reading

* <a href="datascript-events/">Events</a>:  Each DataScript will executed when an event is triggered, such as when an HTTP request or HTTP response is received by the virtual service. A DataScript must be executed within one or more events.
* <a href="datascript-operators/">Operators</a>:  DataScripts may make use of operators, which may be relational, logical, or arithmetic.
* <a href="datascript-functions/">Functions: </a> Functions are Avi-specific commands, such as HTTP redirects or closing a client connection.
* <a href="datascript-execution-priority/">Execution Priority</a>:  DataScripts have a complex relationship with other features within Avi Vantage, and it is important to understand the order of execution priority when multiple DataScripts are attached to a virtual service, or Policies and other features conflict with the DataScripts.
* <a href="datascript-troubleshooting-rules/">Troubleshooting</a>:  DataScripts may fail to save / load at time of configuration, or they may be created without issue but fail to execute when applied to traffic. 

 

 
