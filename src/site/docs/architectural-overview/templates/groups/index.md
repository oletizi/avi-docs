---
title: Groups
layout: default
---
Avi Vantage uses "groups" to separate long lists from the complexity of the feature they may be applied against. This is particularly useful for simplifying the automation of API calls. This article describes the following types of groups:

* IP group: named set of IP addresses
* String group: named set of string values
* MicroService group: named set of microservices

You may change the contents of these types of groups at any time while the system is running without interrupting existing traffic. Objects that reference the group will use the updated version for subsequent queries they perform against it.

### IP Group

IP groups are comma-separated lists of IP addresses that may be referenced by profiles, policies, and logs. IP groups may contain the following types of entries:

* IPv4 address
* IP range
* IP/Mask
* Country code
* End-point group

The following are examples of IP groups used elsewhere within the Vantage configuration:

* Network security policy: may be configured to drop any clients coming from a blacklist of IP addresses. Rather than maintain a long list within the policy, Vantage maintains the rule logic of that policy separately from the list of addresses, which are kept in the IP group. A user can be granted a role that allows them to update the list of IP addresses without being able to change the policy itself.
* Logs: classify clients by their IP address and match them against an included geographic country location database. You may override this database by using an IP group to create specific mappings such as internal IP addresses. For instance, LA_Office may contain 10.1.0.0/16, while NY_Office contains 10.2.0.0/16. Logs will show these clients as originating from these locations. Logs searches may also be performed on the group name such as LA_Office.

The table on this tab contains the following information for each IP group:

<img src="img/template_groups_ip.jpg" alt="">

* **Name:** Name of the IP group.
* **IP Address or Ranges:** Number of IP address, networks, or address ranges.
* **Country Code or EPG:** Any configured country codes or end point groups are listed.

### Create an IP Group

The Create IP Group and Edit IP Group popups share the same interface.

<a href="img/template_groups_create-edit-2.jpg"><img src="img/template_groups_create-edit-2.jpg" alt="template_groups_create-edit" width="764" height="291"></a> To create or edit an IP group:

* **Name:** Enter a unique name for the IP group.
* **Select by IP Address:** Add one or more addresses to the list. Any combination of the following methods may be used:

* **IP Address:** Comma separated list: 10.0.0.1, 10.0.0.5
* **Range:** 10.0.0.10–10.0.0.20
* **Mask:** 10.1.0.0/16
* **Upload File:** Click the Upload File button on the right to navigate to and upload a comma separated value (CSV) file that contains any combination of IP addresses, range, and/or masks.
* **Select by Country Code or EPG:** Select one or more countries, or type the country name into the search field to filter. Countries may not be combined within an IP group with individual IP addresses. An IP group that contains countries may also not be used as a list of servers for pool membership.For cloud environments set up for Cisco ACI, end point groups are shown. EPGs are IP addresses or groups configured within the Cisco APIC controller and automatically imported into Vantage.

### String Group

String groups contain arbitrary lists of comma-separated text that may consist of HTTP URIs, names, or other content to be filtered against for many purposes such as black or white lists.

An HTTP security policy may use a string group to filter allowed HTTP URIs.

An HTTP application profile may use a string group to identify mobile users to ensure they receive more aggressively compressed HTML files.

The table on this tab contains the following information for each string group:

<img src="img/template_groups_string_tab.jpg" alt="">

* **Name:** Name of the string group.
* **Number of Strings:** Number of strings within a string group.

### Create a String Group

The Create String Group and Edit String Group popups share the same interface.

<img src="img/template_groups_string_create-edit.jpg" alt="">

To create or edit a string group:

* **Name:** Enter a unique name for the String Group in the Name field.
* **Strings:** Add one or more text strings to the list. You may use any combination of the following methods:

* **String:** Enter any text in the field, and then click the + String button to add.
* **Upload File:** Click the Upload File button on the right to navigate to and upload a comma separated value (CSV) file that contains text.

### MicroService Group

This article will be updated with more information on this feature.