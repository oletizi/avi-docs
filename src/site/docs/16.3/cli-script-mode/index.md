---
title: CLI - Script Mode
layout: default
---
In Avi Vantage 16.3, a set of CLI enhancements are introduced with the following in mind:

* Easy automation using the CLI
* Search for specific keywords in the configuration using the CLI
* Quick cut-and-paste to make modifications or resolve some issues with the CLI 

A new CLI mode, <code>script</code>, is introduced in 16.3. In the <code>script</code> mode, the input and output of the CLI command is expected to be in a YAML format. This is a direct conversion of what is presented in the API input and output as JSON into YAML. YAML was chosen for presentation as it offers an easier interaction without having to worry about the syntax such as comma, quotes, curly braces, etc. It is easier to work with YAML primarily for cut-and-paste and incremental changes to an existing object. Multi-line configuration of object uses a bash heredoc style. You can find more information on this under <a href="https://en.wikipedia.org/wiki/Here_document">https://en.wikipedia.org/wiki/Here_document</a>.

<pre class="command-line language-bash" data-prompt="1,2|: > " data-output="3-99"><code>terminal mode script
show pool p1
name: p1
server_count: 3
servers:
- hostname: 1.1.1.1
ip:
addr: 1.1.1.1
type: V4
- hostname: 2.2.2.2
ip:
addr: 2.2.2.2
type: V4
tenant_ref: https://localhost/api/tenant/admin
uuid: pool-b0cb56dc-cc24-4b87-9d19-7bf790d2e582</code></pre> 

## Configuration using the Script mode

<pre class="command-line language-bash" data-prompt="1|: > " data-output="2-99"><code>configure pool p1 &lt;&lt; END
name: p1
server_count: 3
servers:
- hostname: 1.1.1.1
ip:
addr: 1.1.1.1
type: V4
- hostname: 2.2.2.2
ip:
addr: 2.2.2.2
type: V4
- hostname: 3.3.3.3
ip:
addr: 3.3.3.3
type: V4
tenant_ref: https://localhost/api/tenant/admin
uuid: pool-b0cb56dc-cc24-4b87-9d19-7bf790d2e582
END
Updating an existing object
name: p1
server_count: 3
servers:
- hostname: 1.1.1.1
ip:
addr: 1.1.1.1
type: V4
- hostname: 2.2.2.2
ip:
addr: 2.2.2.2
type: V4
- hostname: 3.3.3.3
ip:
addr: 3.3.3.3
type: V4
tenant_ref: https://localhost/api/tenant/admin
uuid: pool-b0cb56dc-cc24-4b87-9d19-7bf790d2e582</code></pre> 