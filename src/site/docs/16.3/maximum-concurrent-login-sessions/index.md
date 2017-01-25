---
title: Maximum Concurrent Login Sessions
layout: layout163
---
This feature prevents having more than a configurable number of concurrent sessions. Default value is set to 0, which means the concurrent session check is bypassed. Additional logins are prevented if the maximum concurrent session count has been reached. Beyond this, the user can choose to login using shell <code>--clear-sessions</code> which will invalidate all the active sessions.

The administrator controls this feature via Avi Vantage's CLI or REST API. The setting for it is maintained within the <code>UserAccountProfile</code> object. By default, all the users in the system are attached to “Default-User-Account-Profile," as shown below. If required, the admin can create a new user account profile with different thresholds.
<code><br> admin:10-10-24-52]: &gt; show useraccountprofile Default-User-Account-Profile<br> +-------------------------------+---------------------------------------------------------+<br> | Field                         | Value                                                   |<br> +-------------------------------+---------------------------------------------------------+<br> | uuid                          | useraccountprofile-6753548e-7ac5-4601-939b-ad4394405db4 |<br> | name                          | Default-User-Account-Profile                            |<br> | max_password_history_count    | 0                                                       |<br> | max_login_failure_count       | 20                                                      |<br> | account_lock_timeout          | 30                                                      |<br> | max_concurrent_sessions       | 0                                                       |<br> | credentials_timeout_threshold | 0                                                       |<br> +-------------------------------+---------------------------------------------------------+<br> </code>
To change the maximum number of concurrent sessions:
<code><br> [admin:10-10-24-52]: &gt; configure useraccountprofile Default-User-Account-Profile<br> Updating an existing object. Currently, the object is:<br> [admin:10-10-24-52]: useraccountprofile&gt; max_concurrent_sessions 5<br> Overwriting the previously entered value for max_concurrent_sessions<br> [admin:10-10-24-52]: useraccountprofile&gt; save<br> +-------------------------------+---------------------------------------------------------+<br> | Field                         | Value                                                   |<br> +-------------------------------+---------------------------------------------------------+<br> | uuid                          | useraccountprofile-6753548e-7ac5-4601-939b-ad4394405db4 |<br> | name                          | Default-User-Account-Profile                            |<br> | max_password_history_count    | 0                                                       |<br> | max_login_failure_count       | 20                                                      |<br> | account_lock_timeout          | 30                                                      |<br> | max_concurrent_sessions       | 5                                                       |<br> | credentials_timeout_threshold | 0                                                       |<br> +-------------------------------+---------------------------------------------------------+<br> </code>

 

If the threshold has been reached, the user may choose to invalidate existing sessions using the <code>--clear-sessions</code> option of the <code>shell</code> command:
<code><br> root@10-10-24-52:/home/admin# shell<br> admLogin: admin<br> Password:</code>

WARNING: Maximum concurrent session count has been reached.
Please clear the sessions using shell --clear-sessions

root@10-10-24-52:/home/admin/# shell --clear-sessions
Login: admin
Password:
[admin:10-10-24-52]: > 

Such sessions “feel” their invalidation one of several ways:

* UI users are presented with a login screen.
* Users who have logged into the CLI will … to be completed after Sambit researches the matter ...
* A REST API user’s next API call will fail to validate. Or, if the REST API user is executing calls within a session, the session is ended. 