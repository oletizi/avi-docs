---
title: CLI Enhancements in Avi Vantage 16&#46;3
layout: default
---
In Avi Vantage 16.3, a set of CLI enhancements are introduced with the following in mind:

* Easy automation using CLI
* Search for specific keywords in the configuration using CLI
* Quick cut-and-paste to make modifications or resolve some issues with CLI 

## CLI Modes

The CLI has the following modes:

* **interactive:** This is the default mode that persists from previous releases. Configuration of an object having nested fields requires the user to enter into a sub-mode context. To save the sub-object, an “exit” or “save” keyword is used. To cancel the edits made to a sub-object, a “cancel” keyword is used.
* **script:** This mode permits one to interact with the CLI using YAML format. A <code>show</code> of a single object displays the object in a YAML format instead of table format. Configuration of the object expects a cut-and-paste of the entire object in a YAML format as well.
* **linux_command_line:** This mode permits one to interact with the CLI in a fashion similar to a traditional Linux command line program, where all the arguments are presented in <code>--parameter &lt;value&gt;</code> format. Multi-line configuration of object uses a bash heredoc style. You can find more information on this under <a href="https://en.wikipedia.org/wiki/Here_document">https://en.wikipedia.org/wiki/Here_document</a>. 

Enter one of the three modes by executing one of the following commands:

: > terminal mode interactive

: > terminal mode script

: > terminal mode linux_command_line

This article reveals enhancements that simplify the operation of these modes. Two companion KBs provide specifics for the two new modes:

* <a href="/docs/16.3/cli-script-mode/">CLI - Script Mode</a>
* <a href="/docs/16.3/cli-linux-command-line-mode/">CLI - Linux Command Line Mode</a> 

## Displaying Default Values

When an object is created, any field not explicitly configured by the user has its value set to a default if there is one. The <code>show</code> command displays the entire object, including the default values that have been set for it. Any subsequent modification of the object in the CLI involves a GET of the object followed by a PUT of it with the updated value. To simplify the interactions in CLI, a new command has been introduced that only displays the configured attributes of the object. This drastically reduces the output as seen by the user.  This command is applicable in all the modes of CLI. The below example shows the output of a <code>show pool</code> command without and then with the <code>terminal output brief</code> command in play.


<pre class="command-line language-bash" data-prompt="1,43,46,47|: > " data-output="2-42,44,45,48-99"><code>show pool p1
+---------------------------------------+-------------------------------------------+
| Field                                 | Value                                     |
+---------------------------------------+-------------------------------------------+
| uuid                                  | pool-a4a978a9-9899-44cb-b9ed-1bb656357015 |
| name                                  | p1                                        |
| default_server_port             | 80                                        |
| graceful_disable_timeout   | 1                                         |
| connection_ramp_duration | 10                                        |
| max_concurrent_connections_per_server | 0                                        |
| servers[1]                            |                                          |
| ip                                   | 3.3.3.3                                  |
| hostname | 3.3.3.3 |
| enabled | True |
| ratio | 1 |
| verify_network | False |
| resolve_server_by_dns | False |
| static | False |
| servers[2] | |
| ip | 2.2.2.2 |
| hostname | 2.2.2.2 |
| enabled | True |
| ratio | 1 |
| verify_network | False |
| resolve_server_by_dns | False |
| static | False |
| server_count | 2 |
| lb_algorithm | LB_ALGORITHM_LEAST_CONNECTIONS |
| inline_health_monitor | True |
| use_service_port | False |
| capacity_estimation | False |
| server_auto_scale | False |
| vrf_ref | global |
| fewest_tasks_feedback_delay | 10 |
| enabled | True |
| request_queue_enabled | False |
| request_queue_depth | 128 |
| host_check_enabled | False |
| sni_enabled | True |
| tenant_ref | admin |
| cloud_ref | Default-Cloud |
+---------------------------------------+-------------------------------------------+
terminal output
brief Brief output with defaults
detailed Detailed output including defaults
terminal output brief
show pool p1
+--------------+-------------------------------------------+
| Field | Value |
+--------------+-------------------------------------------+
| uuid | pool-a4a978a9-9899-44cb-b9ed-1bb656357015 |
| name | p1 |
| servers[1] | |
| ip | 3.3.3.3 |
| hostname | 3.3.3.3 |
| servers[2] | |
| ip | 2.2.2.2 |
| hostname | 2.2.2.2 |
| server_count | 2 |
| tenant_ref | admin |
+--------------+-------------------------------------------+</code></pre> 

## Display Running Configuration

show running_config CLI command has been added to display the configuration in a format that can be used to inspect, modify and cut and paste incremental changes to object. As a part of this, the following filter criteria can be specified:

* obj_type: Specifies the object type(s) that you are interested in. eg. virtualservice, pool, serviceengine, etc
* tenant: Specifies the tenant name
* search: Specifies the search text. This can be used to search for a given hostname, IP address, etc.
* For a given filter criteria, multiple values can be given using a “,” operator. Eg. search=1.1.1.1,2.2.2.2,3.3.3.3 

A few examples of this CLI command are:


<pre class="command-line language-bash" data-prompt="1-3|: > " data-output="4-99"><code>show running_config
show running_config --obj_type virtualservice --search 1.1.1.1
show running_config
configure tenant t2 --uuid tenant-187e2e5c-fc5c-4fbb-9476-ca8aedcd6a84 --local True --config_settings.tenant_vrf False --config_settings.se_in_provider_context True --config_settings.tenant_access_to_provider_se True

configure pool bliss --uuid pool-fa96347f-02e5-4e1b-9bb9-7fe091910559 --servers.1.ip 10.10.10.9 --servers.1.hostname 10.10.10.9 --server_count 1 --tenant_ref t2

configure virtualservice bliss_vs --uuid virtualservice-c36b8b3f-0705-4c45-9116-e836f76059ee --ip_address 10.10.10.10 --services.1.port 80 --services.1.port_range_end 80 --pool_ref genie --tenant_ref t2</code></pre> 

## Tenancy Implications

Multi-tenancy stays the same across the modes. To make changes in a specific tenant, you need to execute “switchto tenant <tenant>” CLI command. The command, show running_config, displays only the objects as configured in that tenant with the exception of admin where the entire configuration across all tenants are displayed.

## Multiple Line Input

Certain fields, such as SSL key and certificate are multi-line strings in the PEM format. You can specify them in one of two ways:

### Input using the file:<filename> option, where the content is read from a file

<pre class="command-line language-bash" data-prompt="1|admin:10-10-24-123: > " data-output="2-99"><code>configure sslkeyandcertificate foo --key file:/tmp/test.key --certificate.certificate file:/tmp/test.pem

--uuid sslkeyandcertificate-92d4cea0-0753-4103-afb5-02fc5b6a3a45 --type ssl_certificate_type_virtualservice --certificate.version 2 --certificate.serial_number 3 --certificate.self_signed False --certificate.issuer.common_name ca.local --certificate.issuer.organization Controller --certificate.issuer.locality Santa Clara --certificate.issuer.state California --certificate.issuer.country US --certificate.issuer.distinguished_name C=US, ST=California, L=Santa Clara, O=Controller, CN=ca.local --certificate.subject.common_name se.local --certificate.subject.organization Controller --certificate.subject.locality Santa Clara --certificate.subject.state California --certificate.subject.country US --certificate.subject.distinguished_name C=US, ST=California, L=Santa Clara, O=Controller, CN=se.local --certificate.key_params.algorithm ssl_key_algorithm_rsa --certificate.key_params.rsa_params.key_size ssl_key_4096_bits --certificate.key_params.rsa_params.exponent 65537 --certificate.signature_algorithm sha1WithRSAEncryption --certificate.not_before 1970-01-01 00:00:00 --certificate.not_after 2026-09-04 23:17:25 --certificate.fingerprint SHA1 Fingerprint=CA:69:88:6A:51:70:A2:0C:3B:2C:BB:66:36:FF:C7:E4:DF:15:C6:08
--certificate.expiry_status ssl_certificate_good --certificate.days_until_expire 365 --key_params.algorithm ssl_key_algorithm_rsa --key_params.rsa_params.key_size ssl_key_4096_bits --key_params.rsa_params.exponent 65537 --status ssl_certificate_finished --ca_certs.1.name ca.local --tenant_ref admin</code></pre> 

### Input the string in-line in a multi_line mode

<pre class="command-line language-bash" data-prompt="1|admin:10-10-24-123: > " data-output="2-999"><code>configure sslkeyandcertificate foo &lt;&lt; END
--key -----BEGIN PRIVATE KEY-----
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
y0HhhNpCJQLuo46QXn2wBb7zdxAj
-----END PRIVATE KEY-----
--certificate.certificate -----BEGIN CERTIFICATE-----
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
IS08rpQlKCIxhpeqQTay
-----END CERTIFICATE-----
END

--uuid sslkeyandcertificate-aa46c924-3d30-4678-a456-04aacaa8496f
--type ssl_certificate_type_virtualservice
--certificate.version 2
--certificate.serial_number 3
--certificate.self_signed False
--certificate.issuer.common_name ca.local
--certificate.issuer.organization Controller
--certificate.issuer.locality Santa Clara
--certificate.issuer.state California
--certificate.issuer.country US
--certificate.issuer.distinguished_name C=US, ST=California, L=Santa Clara, O=Controller, CN=ca.local
--certificate.subject.common_name se.local
--certificate.subject.organization Controller
--certificate.subject.locality Santa Clara
--certificate.subject.state California
--certificate.subject.country US
--certificate.subject.distinguished_name C=US, ST=California, L=Santa Clara, O=Controller, CN=se.local
--certificate.key_params.algorithm ssl_key_algorithm_rsa
--certificate.key_params.rsa_params.key_size ssl_key_4096_bits
--certificate.key_params.rsa_params.exponent 65537
--certificate.signature_algorithm sha1WithRSAEncryption
--certificate.not_before 1970-01-01 00:00:00
--certificate.not_after 2026-09-04 23:17:25
--certificate.fingerprint SHA1 Fingerprint=CA:69:88:6A:51:70:A2:0C:3B:2C:BB:66:36:FF:C7:E4:DF:15:C6:08

--certificate.expiry_status ssl_certificate_good
--certificate.days_until_expire 365
--key_params.algorithm ssl_key_algorithm_rsa
--key_params.rsa_params.key_size ssl_key_4096_bits
--key_params.rsa_params.exponent 65537
--status ssl_certificate_finished
--ca_certs.1.name ca.local
--tenant_ref admin</code></pre> 