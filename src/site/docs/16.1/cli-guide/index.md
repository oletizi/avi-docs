---
layout: cli-guide
title: CLI Guide
---

Avi Vantage provides a robust load balancing and visibility platform for any environment. Avi’s unique architecture separates the control/management plane from the data plane. The entire load balancing fabric of distributed Service Engines (SEs), or micro-load balancers, can be managed from a Controller or cluster Controller IP (in a redundant configuration).

Avi may be managed via GUI, API, or CLI. Both the GUI and CLI are built on top of a RESTful API, which means any command within the CLI has a corresponding API that it is executing.

## How to Access the CLI ##

To access the command line interface, either SSH to the Avi Controller or access the Controller via the console from an orchestrator such as vCenter. Some user accounts may default into Linux bash. For these accounts, enter the Avi shell by typing: `shell`

<pre class="console">username@Avi-15-2:~$ <strong>shell</strong>
:&gt;
</pre>

Similarly, to exit the Avi shell into Linux, type: `bash`

<pre class="console">: &gt; <strong>bash</strong>
username@Avi-15-2:~$
</pre>

When jumping from Linux bash to the Avi shell, or from the Avi shell to Linux bash, you may return to the previous mode by typing: `exit`

<pre class="console">username@Avi-15-2:~$ <strong>exit</strong>
:&gt;
</pre>

> **Note:** While it is possible to directly access the CLI of a Service Engine, it is not recommended, and may only be used for basic troubleshooting. All configuration management must be done from the Controller.

### Navigation and Help ###

Dropping into the CLI leaves the administrator at a blank command prompt. To see a list of available commands, press the tab key twice. The commands shown are relative to the current location within the CLI hierarchy.

While typing a command, tab will autocomplete the command. Double tab will return a list of available options for the command in the left column. Most options include a brief help description, which is shown in the right column.

<pre class="console">: &gt; <strong>export</strong>
configuration       export configuration
serviceengine       export serviceengine ova file from controller
virtualservice      export virtual service
</pre>

Commands or parameters may require multiple words or options. If there is only a single word or option, pressing tab will auto complete the next word in the command:

<pre class="console">: &gt; <strong>export configuration [tab]</strong>
: &gt; <strong>export configuration file [tab]</strong>
WORD (required)
: &gt; <strong>export configuration file mybackup</strong>
Completed writing the export configuration to mybackup
:&gt;
</pre>

Other navigational commands:

*   Use the up arrow key to cycle through and reuse previously executed commands.

*   To see the commands in a list format, use the `history` command.

*   Pipe can be used to filter results, such as `| grep address` or `| more`. Useful with the `watch` command.

### Sub-Mode Navigation ###

Many areas of the CLI contain sub-modes, which are nested sub-sections pertaining to the current command. To enter the sub-mode, enter the relevant command. Within the context of a sub-mode, changes are not committed until explicitly saved. Type save to exit the sub-mode while committing changes. To exit the sub-mode without saving changes, type cancel. When in a sub-mode, or a nested sub-mode, the command prompt will change to reflect the current sub-mode.

<pre class="console">:&gt;
: &gt; <strong>debug virtualservice Test-VS</strong>
: debugvirtualservice&gt; <strong>debug_ip</strong>
: debugvirtualservice:debug_ip&gt;

: debugvirtualservice:debug_ip&gt; <strong>cancel</strong> 
: debugvirtualservice&gt; <strong>cancel</strong>
:&gt;
</pre>

It is possible to enter a command which enters a sub-mode, while also adding applicable flags. This will simultaneously navigate into the sub-mode and execute the command. Subsequent commands within the sub-mode do not use the initial sub-mode command.

<pre class="console">: debugvirtualservice&gt;
: debugvirtualservice&gt; <strong>debug_ip addrs 10.1.1.1</strong>
: debugvirtualservice:debug_ip&gt; <strong>addrs 10.1.1.2</strong>
: debugvirtualservice:debug_ip&gt; <strong>save</strong>
: debugvirtualservice&gt;
</pre>

### Where ###

When operating within a sub-mode, multiple changes can be made to parameters. To see the current status of the configured parameters, use the `where` command.

<pre class="console">: debugvirtualservice&gt; <strong>debug_ip addrs 10.1.1.1</strong>
: debugvirtualservice:debug_ip&gt; <strong>addrs 10.1.1.2</strong>
: debugvirtualservice:debug_ip&gt; <strong>addrs 10.1.1.3</strong>
: debugvirtualservice:debug_ip&gt; <strong>where</strong>
Tenant: admin
+----------+----------+
| Field    | Value    |
+----------+----------+
| addrs[1] | 10.1.1.1 |
| addrs[2] | 10.1.1.2 |
| addrs[3] | 10.1.1.3 |
+----------+----------+
: debugvirtualservice:debug_ip&gt;
</pre>

### API ###

When executing any CLI command, it may include the `--api-detail` flag. This flag will echo the API call the Avi CLI is performing, and the command executes as it would without this flag. This can be useful when building API driven automation scripts.

<pre class="console">show serviceengine --api-detail
REST API Request
API: /api/serviceengine?owned_by_controller=True&join_subresources=runtime
</pre>

API echoed output may be enabled for every command executed during a single CLI session via terminal `display_api_details`.
