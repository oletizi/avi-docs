---
title: Clickjacking Protection
layout: default
---
Starting in version Avi Vantage 15.3, the Avi Controller has clickjacking protection. The clickjacking protection is enabled by default.

Unfortunately, Horizon integration with iframes does not work with the option enabled. To work around this issue, disable the option by logging into the Controller CLI and entering the commands show below:

<pre class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="1-100"><code>
$&gt; shell
Login: admin
Password:

: &gt; configure systemconfiguration
: systemconfiguration&gt; portal_configuration
: systemconfiguration:portal_configuration&gt; no enable_clickjacking_protection
: systemconfiguration:portal_configuration&gt; save
: systemconfiguration&gt; save
: &gt; exit
$&gt;
</code></pre> 