---
title: User Account Security
layout: layout163
---
Avi Vantage implements a variety of mechanisms by which to protect its control plane from overload or abuse. Some of these were inspired by penetration test findings. Details about these mechanisms can be found in the below articles.

* <a href="{% vpath %}/super-user-accounts/">Super User Accounts </a>
* <a href="{% vpath %}/strong-password-enforcement/">Strong password enforcement</a>
* <a href="{% vpath %}/password-history-enforcement/">Password history enforcement</a> (16.3+)
* <a href="{% vpath %}/ssh-users-and-keys/#ssh-key-based-controller-login">Password-less access to Controller</a> (16.3+)
* <a href="{% vpath %}/user-account-lockout/">User account lockout</a> (16.3+)
* <a href="{% vpath %}/maximum-concurrent-login-sessions/">Maximum concurrent login sessions</a> (16.3+)
* <a href="{% vpath %}/user-credentials-timeout">User credentials timeout</a> (16.3+)