---
title: Overview of Avi Vantage Security
layout: layout171
---
Avi Networks strives to ensure the highest level of security, adhering to rigorous testing and validation standards. Avi Vantage includes numerous security related features to ensure the integrity of the Vantage system as well as the applications and services protected by Vantage. This article is focused on the security of Avi Service Engines and Avi Controllers.

### Industry Validation

Avi regularly submits Vantage for penetration testing from industry-leading security auditors. The results of these tests can be made available to interested customers. Direct any requests to your local sales team.
Additionally, many of the largest and most trusted brands on the Internet have subjected Vantage to their own testing, or testing by third party companies such as Qualys and Rapid7. This continuous testing ensures that in addition to the proven success of Vantage in public and private networks, it has been thoroughly vetted by known industry security leaders.

The following are a few examples of web UI and other attack vectors tested via external penetration testing:

* SQL injection
* Cross site request forgery (CSRF)
* Cross site scripting (XSS)
* Arbitrary code execution
* Credential disclosure
* Clickjacking
* Improper cookie settings
* Password protection via PBKDF2
* Encryption of SSL certificate's private keys
* Role based access control
* Strong output validation to guard against disclosure of sensitive fields such as passwords, export of keys 

 

### Patching Security Issues

Despite the best attempts to proactively resolve any potential threat prior to the release of code, it is important to ensure a solid plan of action in the event a security hole is discovered in customer deployed software.
Avi Networks strongly recommends key administrators subscribe to Avi's mailing list. Security alerts are proactively sent to customers to notify them if an issue has been found and the potential mitigation required. Subscribe via Avi's customer portal.
Avi also publishes responses to Common Vulnerabilities and Exposures (CVEs) of note, which include known vulnerabilities of Avi Vantage or software used by Vantage, such as SSL or Linux. Avi may also publish CVE responses to issues that do not impact Vantage in order to explicitly inform our customers that they are protected. These CVEs are published to the Avi knowledge base site, but not sent proactively via email alerts.
See also:

* <a href="/docs/17.1/support-terms-and-conditions">Support Terms &amp; Conditions</a>
* <a href="/docs/17.1/search?search=cve">CVEs</a>
* <a href="/docs/17.1/upgrading-the-avi-vantage-software">Upgrade Vantage Software</a> 

### Hardening Vantage

With a basic deployment of Avi Vantage, the system is secured and reasonably locked down. However, many administrators may wish to customize the security posture or further tighten policies regarding who can access Vantage. Avi strongly recommends thoroughly reviewing the choices for securing Vantage which are essential for guaranteeing the security of Vantage in production environments where the potential exposure to malicious attack is more severe.

* <a href="/docs/17.1/protocol-ports-used-by-avi-vantage-for-management-communication/">Open Ports Used by Vantage</a>
* <a href="/docs/17.1/controller-to-service-engine-communication">Controller-to-SE Communication</a>
* <a href="/docs/17.1/strong-password-enforcement">Strong Password Enforcement</a>
* <a href="/docs/17.1/clickjacking-protection">Clickjacking Protection</a>
<!-- TODO: Figure out where this is actually supposed to point. It's a broken link on the KB. -->
* <a href="/docs/17.1/user-accounts/">Custom Roles and Users</a>
* <a href="/docs/17.1/ldap-auth-profile-test">AAA via LDAP</a>
* <a href="/docs/17.1/securing-management-ip-access">Securing Management IP Access</a> 

 

