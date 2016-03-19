---
layout: configuration-guide
title: Templates
---

A template is a named set of configuration items or option settings. Templates greatly simplify configuration by allowing the same template to be used by multiple objects. The settings in the template apply to all the objects that are associated with (bound to) the template.

A change to a template affects all objects that are associated with that template. A template does not need to be rebound to its objects after modification. The change is immediately applied to the objects that are associated with the template. For example, if the option to insert X-Forwarded-For headers is disabled in an HTTP application profile, that change is applied to all Virtual Services that use the profile.

Avi Vantage uses the following types of templates:

*   [Profiles ›][1]
*   [Groups ›][2]
*   [Security ›][3]
*   [Scripts ›][4]

 [1]: ./templates-profiles
 [2]: ./templates-groups
 [3]: ./templates-security
 [4]: ./templates-scripts