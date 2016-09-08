---
title: All Tenants View
layout: default
---
The All Tenants view provides a global view of all Vantage objects across all tenants. This includes all the tenants, including the admin tenant.

The All Tenants view is intended for viewing objects but not for configuring them, and provides read-only access. New objects cannot be created in this view.

Note: Beginning in Avi Vantage 16.1, the All Tenants view is supported only for administrative user accounts that are configured to be superuser. To use the feature, you must log in with a Vantage user account that has the role System-Admin and the superuser attribute enabled.

To switch the focus of the management session to the All Tenants view, use any of the following methods.

### Web Interface

1. From the user administration menu (next to the Help button on the top menu of the web interface), select Tenant View.

<a href="img/all-tenants1.png"><img src="img/all-tenants1.png" alt="all-tenants1" width="218" height="178"></a>
1. Select All Tenants.
<a href="img/all-tenants2.png"><img src="img/all-tenants2.png" alt="all-tenants2" width="450" height="305"></a>

### CLI

Enter the following command:
<pre crayon="false" class="command-line language-bash" data-prompt=":&nbsp;>" data-output="2"><code>switchto tenant *
Switching to tenant *
&nbsp;</code></pre>

Specifying /* (wildcard) instead of a tenant name gives access to objects across all tenants.

### API

Set the value of X-Avi-Tenant in the HTTP request header to /* (wildcard).