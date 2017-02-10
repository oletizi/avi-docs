---
title: HTTP Basic Auth for API Queries
layout: layout162
---
API calls from a client to the Avi Vantage Controller must first be authenticated, either by HTTP session based auth or HTTP basic auth. Use of HTTP basic authentication for API access is unrelated to the use of basic auth for clients accessing a virtual service in which the Service Engine is proxying the authentication.

Authenticated API calls are still subject to normal auth settings, regardless the method used. The user account used for authentication may be validated by the Controller via a local database or remote (such as LDAP), may be limited to a specific tenant, or have limited roles or access levels.

Prior to v15.3, both session based and HTTP basic auth could be used for API calls. From version 15.3 and later, HTTP basic auth is disabled by default for increased security.

### Enable via CLI

HTTP Basic Authentication may be enabled via the following CLI commands.

<pre>bash# shell
: &gt; configure systemconfiguration
: systemconfiguration&gt; portal_configuration
: systemconfiguration:portal_configuration&gt; allow_basic_authentication
Overwriting the previously entered value for allow_basic_authentication
: systemconfiguration:portal_configuration&gt; exit
: systemconfiguration&gt; exit
</pre> 

Truncated view of the results:

<pre>+-------------------------------------+----------------------------------+
| Field                               | Value                            |
+-------------------------------------+----------------------------------+
| uuid                                | default                          |
| portal_configuration                |                                  |
|   enable_https                      | True                             |
|   redirect_to_https                 | True                             |
|   enable_http                       | True                             |
|   enable_clickjacking_protection    | True                             |
|   <b>allow_basic_authentication</b>        | <b>True</b>                             |
|   password_strength_check           | False                            |
+-------------------------------------+----------------------------------+
</pre> 

### Enable via API

HTTP Basic Authentication method may be enabled by setting "allow_basic_authentication" = True in "/api/systemconfiguration" under "portal_configuration".

Truncated view of the results:

<pre>--snip--
    docker_mode: false,
    portal_configuration: 
    {
        use_uuid_from_input: false,
        redirect_to_https: true,
        sslprofile_ref: "https://10.10.5.27/api/sslprofile/sslprofile-0-1",
        <b>allow_basic_authentication: true,</b>
        enable_clickjacking_protection: true,
        enable_https: true,
        sslkeyandcertificate_refs: 
        [
            "https://10.1.1.10/api/sslkeyandcertificate/sslkeyandcertificate-ae6c1033-859b"
        ],
        password_strength_check: false,
        enable_http: false
    },
    --snip--
</pre> 