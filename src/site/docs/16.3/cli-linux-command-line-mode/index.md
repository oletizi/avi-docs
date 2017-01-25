---
title: CLI - Linux Command Line Mode
layout: 16.3
---
In Avi Vantage 16.3, a set of CLI enhancements are introduced with the following in mind:

* Easy automation using the CLI
* Search for specific keywords in the configuration using the CLI
* Quick cut-and-paste to make modifications or resolve some issues with the CLI 

A new CLI mode, <code>linux_command_line</code>, is introduced in 16.3. This mode allows the user to interact with the CLI in a fashion similar to a traditional Linux command line program, where all the arguments are presented in <code>--parameter value </code> format. Multi-line configuration of object uses a bash heredoc style. You can find more information on this under <a href="https://en.wikipedia.org/wiki/Here_document">https://en.wikipedia.org/wiki/Here_document</a>.

In the <code>linux_command_line</code> mode, the entire object is presented in the form of <code>--parameter value</code> where each parameter represents a field in the object specified in a fully qualified path. An example of this is:

* IP address of a server in a pool is specified as <code>--servers.index.ip</code>. This is equivalent to referring to this attribute as <code>pool[‘servers’][index][‘ip’].</code> A quick note, however, is that index starts with 1 in the CLI but is converted to 0-based in the API interactions. 
<pre class="command-line language-bash" data-prompt=": >" data-output="4-99"><code>terminal mode linux_command_line
terminal --linux_cmd_output single_line
show pool p2
--uuid pool-b0cb56dc-cc24-4b87-9d19-7bf790d2e582 --default_server_port 80 --graceful_disable_timeout 1 --connection_ramp_duration 10 --max_concurrent_connections_per_server 0 --servers.1.ip 1.1.1.1 --servers.1.hostname 1.1.1.1 --servers.1.enabled True --servers.1.ratio 1 --servers.1.verify_network False --servers.1.resolve_server_by_dns False --servers.1.static False --servers.1.rewrite_host_header False --servers.2.ip 2.2.2.2 --servers.2.hostname 2.2.2.2 --servers.2.enabled True --servers.2.ratio 1 --servers.2.verify_network False --servers.2.resolve_server_by_dns False --servers.2.static False --servers.2.rewrite_host_header False --servers.3.ip 3.3.3.3 --servers.3.hostname 3.3.3.3 --servers.3.enabled True --servers.3.ratio 1 --servers.3.verify_network False --servers.3.resolve_server_by_dns False --servers.3.static False --servers.3.rewrite_host_header False --server_count 3 --lb_algorithm lb_algorithm_least_connections --inline_health_monitor True --use_service_port False --capacity_estimation False --server_auto_scale False --vrf_ref global --fewest_tasks_feedback_delay 10 --enabled True --request_queue_enabled False --request_queue_depth 128 --host_check_enabled False --sni_enabled True --rewrite_host_header_to_sni False --rewrite_host_header_to_server_name False --tenant_ref admin --cloud_ref Default-Cloud</code></pre>  

## Configuration using the Linux Command Line mode

<pre class="command-line language-bash" data-prompt="1|: > " data-output="2-99"><code>configure pool p2 --uuid pool-7fce112f-c340-4c31-8c65-95e52f4b85ba --servers.1.ip 3.3.3.3 --servers.1.hostname 3.3.3.3 --servers.2.ip 2.2.2.2 --servers.2.hostname 2.2.2.2 --servers.3.ip 1.1.1.1 --servers.3.hostname 1.1.1.1 --servers.4.ip 4.4.4.4 --servers.4.hostname 4.4.4.4 --server_count 4 --tenant_ref admin
Updating an existing object.
p2 --uuid pool-7fce112f-c340-4c31-8c65-95e52f4b85ba --servers.1.ip 3.3.3.3 --servers.1.hostname 3.3.3.3 --servers.2.ip 2.2.2.2 --servers.2.hostname 2.2.2.2 --servers.3.ip 1.1.1.1 --servers.3.hostname 1.1.1.1 --servers.4.ip 4.4.4.4 --servers.4.hostname 4.4.4.4 --server_count 4 --tenant_ref admin</code></pre> 

Some objects are fairly large and so, interacting with the CLI with all these parameters specified in a single line may quickly become cumbersome. To help with this, a CLI setting to change the linux command output as multi_line has been added. This essentially allows the interaction with the CLI with one parameter in each line. An example of this can be found below.

<pre class="command-line language-bash" data-prompt="1-3,14|: > " data-output="4-13,15-99"><code>terminal --linux_cmd_output multi_line

show pool p2
--uuid pool-7fce112f-c340-4c31-8c65-95e52f4b85ba
--servers.1.ip 3.3.3.3
--servers.1.hostname 3.3.3.3
--servers.2.ip 2.2.2.2
--servers.2.hostname 2.2.2.2
--servers.3.ip 1.1.1.1
--servers.3.hostname 1.1.1.1
--server_count 3
--tenant_ref admin

configure pool p2 &lt;&lt; END
--uuid pool-7fce112f-c340-4c31-8c65-95e52f4b85ba
--servers.1.ip 3.3.3.3
--servers.1.hostname 3.3.3.3
--servers.2.ip 2.2.2.2
--servers.2.hostname 2.2.2.2
--servers.3.ip 1.1.1.1
--servers.3.hostname 1.1.1.1
--servers.4.ip 4.4.4.4
--servers.4.hostname 4.4.4.4
--tenant_ref admin
END

Updating an existing object.
--uuid pool-7fce112f-c340-4c31-8c65-95e52f4b85ba
--servers.1.ip 3.3.3.3
--servers.1.hostname 3.3.3.3
--servers.2.ip 2.2.2.2
--servers.2.hostname 2.2.2.2
--servers.3.ip 1.1.1.1
--servers.3.hostname 1.1.1.1
--servers.4.ip 4.4.4.4
--servers.4.hostname 4.4.4.4
--server_count 4
--tenant_ref admin</code></pre>   