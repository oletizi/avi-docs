---
title: Templates
layout: default
---
A template is a named set of configuration items or option settings. Templates greatly simplify configuration by allowing the same settings to be used by multiple objects. The settings in a template apply to all the objects that are associated with (bound to) that template.

A change to a template affects all objects that are associated with that template. A template does not need to be rebound to its objects after modification. The change is immediately applied to the objects that are associated with the template. For example, if the option to insert X-Forwarded-For headers is disabled in an HTTP application profile, that change is applied to all virtual services that use the profile.

Avi Vantage uses the following types of templates:

* <a href="/docs/16.3/configuration-guide/templates/profiles">Profiles ›</a>
* <a href="/docs/16.3/configuration-guide/templates/groups">Groups ›</a>
* <a href="/docs/16.3/configuration-guide/templates/security">Security ›</a>
* <a href="/docs/16.3/configuration-guide/templates/scripts">Scripts ›</a>  