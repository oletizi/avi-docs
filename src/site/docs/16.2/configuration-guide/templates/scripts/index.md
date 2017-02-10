---
title: Scripts
layout: layout162
---
Extensive behavior customization and automation can be done by utilizing scripts for both the control plane with the Python-based ControlScripts, and the data plane via Lua-based DataScripts.

### DataScript

DataScripts are a powerful mechanism for customizing the behavior of Avi Vantage on a per virtual service, or even per client, basis. DataScripts are lightweight scripts coded in Lua. These scripts can be executed against each client making a TCP connection, an HTTP request or response, or other events within the dataplane.

One or more DataScripts may be attached to the rules section of a virtual service.

Scripts may be uploaded or copy/pasted into either the Request Event Script or Response Event Script section. For instance, to restrict access to the secure directory, the following text would be pasted into the Request Event Script section.

<pre><code class="language-lua">if avi.http.uri == "/secure/" then
   avi.http.send(403)
end</code></pre>  

See the <a href="/docs/16.2/datascript-guide">Avi DataScript Guide</a> for complete documentation of commands and example DataScripts.

### ControlScript

ControlScripts are Python-based scripts which execute on the Vantage Controllers. They are initiated by Alert Actions, which themselves are triggered by events within the system. Rather than simply alert an admin that a specific event has occurred, the ControlScript can take specific action, such as altering the Vantage configuration or sending a custom message to an external system, such as telling VMware’s vCenter to scale out more servers if the current servers have reached resource capacity and are incurring lowered health scores.

To create or edit a ControlScript, select create and paste the new script into the window or upload the .py file.

Once the ControlScript is uploaded to Vantage, apply the script via Operations > Alert > Alert Action page.

ControlScripts are executed with limited privileges within the Linux subsystem of the Avi Controller. See standard Python documentation for examples and definitions of Python commands. Vantage configuration changes may be made by API calls from Linux to Avi Vantage via standard API mechanisms.
 