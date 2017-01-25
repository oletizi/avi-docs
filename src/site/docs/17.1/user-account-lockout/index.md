---
title: User Account Lockout
layout: layout171
---
This feature prevents users from logging in after 20 failed attempts. The user account is locked out for 30 minutes after the last failure login attempt. If the account has not been locked, the running count of  failed login attempts is reset to 0 after a valid login.

The administrator controls this feature via Avi Vantage's CLI or REST API. The setting for it is maintained within the <code>UserAccountProfile</code> object. By default, all the users in the system are attached to “Default-User-Account-Profile," as shown below. If required, the admin can create a new user account profile with different thresholds.
<code><br> admin:10-10-24-52]: &gt; show useraccountprofile Default-User-Account-Profile<br> +-------------------------------+---------------------------------------------------------+<br> | Field                         | Value                                                   |<br> +-------------------------------+---------------------------------------------------------+<br> | uuid                          | useraccountprofile-6753548e-7ac5-4601-939b-ad4394405db4 |<br> | name                          | Default-User-Account-Profile                            |<br> | max_password_history_count    | 0                                                       |<br> | max_login_failure_count       | 20                                                      |<br> | account_lock_timeout          | 30                                                      |<br> | max_concurrent_sessions       | 0                                                       |<br> | credentials_timeout_threshold | 0                                                       |<br> +-------------------------------+---------------------------------------------------------+<br> </code>
To change user account lockout attributes:
<code><br> [admin:10-10-24-52]: &gt; configure useraccountprofile Default-User-Account-Profile<br> Updating an existing object. Currently, the object is:<br> [admin:10-10-24-52]: useraccountprofile&gt; max_login_failure_count 30<br> Overwriting the previously entered value for max_login_failure_count<br> [admin:10-10-24-52]: useraccountprofile&gt; account_lock_timeout 60<br> Overwriting the previously entered value for account_lock_timeout<br> [admin:10-10-24-52]: useraccountprofile&gt; save<br> +-------------------------------+---------------------------------------------------------+<br> | Field                         | Value                                                   |<br> +-------------------------------+---------------------------------------------------------+<br> | uuid                          | useraccountprofile-6753548e-7ac5-4601-939b-ad4394405db4 |<br> | name                          | Default-User-Account-Profile                            |<br> | max_password_history_count    | 0                                                       |<br> | max_login_failure_count       | 30                                                      |<br> | account_lock_timeout          | 60                                                      |<br> | max_concurrent_sessions       | 0                                                       |<br> | credentials_timeout_threshold | 0                                                       |<br> +-------------------------------+---------------------------------------------------------+<br> </code>