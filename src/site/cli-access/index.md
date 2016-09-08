---
title: CLI Access
layout: default
---
When accessing the CLI of Avi Vantage, an administrator needs to SSH via port 22 to the IP address of a Controller or the cluster IP.

Avi Controller runs on Ubuntu Linux, which means there are two levels of CLI access. When an administrator logs into the CLI, the admin is first admitted to Linux. From there, the admin may access the Avi shell via a second step, outlined below. In some authentication modes, non-admin accounts may not access Linux, and are instead forwarded directly to the Avi shell.

See also:

* <a href="/docs/cli-guide/">CLI Guide</a>
* <a href="/docs/cli-guide/cli-top-level-commands/">CLI Top-Level Commands</a>

### Access the Controller CLI

To access the command line interface, either SSH (port 22) to the Vantage Controller IP or cluster IP, or access the Controller via the console from an orchestrator such as vCenter. Some user accounts may default into Linux bash. For these accounts, enter the Vantage shell by typing: <code>shell</code>
<pre crayon="false" class="command-line language-bash" data-prompt="username@avi:~$"><code class=" language-bash">shell</code></pre>

Similarly, to exit the Vantage shell into Linux, type: <code>bash</code>

<pre crayon="false" class="command-line language-bash" data-prompt=":&nbsp;>" style="box-sizing: border-box; overflow: auto; font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace; font-size: 13px; display: block; padding: 1em; margin: 0.5em 0px; line-height: 1.5; word-break: normal; word-wrap: normal; color: white; border: 0.3em solid #545454; border-radius: 0.5em; direction: ltr; text-align: left; text-shadow: black 0px -0.1em 0.2em; white-space: pre; word-spacing: 0px; tab-size: 4; box-shadow: black 1px 1px 0.5em inset; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; -webkit-text-stroke-width: 0px; background: #141414;"><code class=" language-bash">bash</code></pre>

When jumping from Linux bash to the Vantage shell, or from the Vantage shell to Linux bash, you may return to the previous mode by typing: <code>exit</code>

<pre crayon="false" class="command-line language-bash" data-prompt="username@avi:~$"><code class=" language-bash">exit</code></pre> 
**Note:** While it is possible to directly access the CLI of a Service Engine, it is not recommended, and may only be used for basic troubleshooting. All configuration management must be done from the Controller.

### Access Using Remote Authentication

When accessing the CLI on a system configured with remote authentication such as LDAP or TACACS, only two accounts are open. These are *admin* and *cli*. The admin account is the standard administrative account for the system, and is maintained as a locally-authenticated account, even in a system configured for remote auth. The *cli* account has no password. Any non-*admin* account should use the account name *cli*, which will then forward the user through Linux to the Avi shell. From the shell the user must log in via their standard account. Non-admin accounts do not have access to Linux.

### Local Avi Shell

For Mac and Linux clients, an Avi CLI package may be installed on the local computer.

* <a href="/cli-installing-the-cli-shell/">Installing the Avi Vantage CLI Shell</a>
* <a href="/installing-the-lbaas-driver-cli-shell-openstack/">Installing the LBaaS CLI Shell (OpenStack with Keystone)</a>