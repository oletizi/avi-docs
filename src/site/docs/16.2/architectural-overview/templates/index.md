---
title: Templates
layout: default
---
A template is a named set of configuration items or option settings. Templates greatly simplify configuration by allowing the same settings to be used by multiple objects. The settings in a template apply to all the objects that are associated with (bound to) that template.

A change to a template affects all objects that are associated with that template. A template does not need to be rebound to its objects after modification. The change is immediately applied to the objects that are associated with the template. For example, if the option to insert X-Forwarded-For headers is disabled in an HTTP application profile, that change is applied to all virtual services that use the profile.

Avi Vantage uses the following types of templates:

* <a href="./profiles">Profiles ›</a>
* <a href="./groups">Groups ›</a>
* <a href="./security">Security ›</a>
* <a href="./scripts">Scripts ›</a>  