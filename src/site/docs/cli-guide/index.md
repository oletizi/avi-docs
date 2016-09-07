---
title: CLI Guide
layout: default
---
Avi Vantage provides a robust load balancing and visibility platform for any environment. Vantage’s unique architecture separates the control/management plane from the data plane. The entire load balancing fabric of distributed Service Engines (SEs), or micro-load balancers, can be managed from a Controller or cluster Controller IP (in a redundant configuration).

Vantage may be managed via GUI, API, or CLI. Both the GUI and CLI are built on top of a RESTful API, which means any command within the CLI has a corresponding API that it is executing.

### How to Access the CLI

To access the command line interface, either SSH to the Vantage Controller or access the Controller via the console from an orchestrator such as vCenter. Some user accounts may default into Linux bash. For these accounts, enter the Vantage shell by typing:

shell
shell

Similarly, to exit the Vantage shell into Linux, type:

bash

bash

When jumping from Linux bash to the Vantage shell, or from the Vantage shell to Linux bash, you may return to the previous mode by typing:

exit

exit
 
**Note:** While it is possible to directly access the CLI of a Service Engine, it is not recommended, and may only be used for basic troubleshooting. All configuration management must be done from the Controller.

### Navigation and Help

Dropping into the CLI leaves the administrator at a blank command prompt. To see a list of available commands, press the tab key twice. The commands shown are relative to the current location within the CLI hierarchy.

While typing a command, tab will autocomplete the command. Double tab will return a list of available options for the command in the left column. Most options include a brief help description, which is shown in the right column.
export configuration export configuration serviceengine export serviceengine ova file from controller virtualservice export virtual service      

Commands or parameters may require multiple words or options. If there is only a single word or option, pressing tab will auto complete the next word in the command:

export configuration [tab] export configuration file [tab] WORD (required) export configuration file mybackup Completed writing the export configuration to mybackup      

Other navigational commands:

* 
Use the up arrow key to cycle through and reuse previously executed commands.
* 
To see the commands in a list format, use the

history
command.
* 
Pipe can be used to filter results, such as

| grep address
or

| more
. Useful with the

watch
command.

### Sub-Mode Navigation

Many areas of the CLI contain sub-modes, which are nested sub-sections pertaining to the current command. To enter the sub-mode, enter the relevant command. Within the context of a sub-mode, changes are not committed until explicitly saved. Type save to exit the sub-mode while committing changes. To exit the sub-mode without saving changes, type cancel. When in a sub-mode, or a nested sub-mode, the command prompt will change to reflect the current sub-mode.
debug virtualservice Test-VS debug_ip cancel cancel

It is possible to enter a command which enters a sub-mode, while also adding applicable flags. This will simultaneously navigate into the sub-mode and execute the command. Subsequent commands within the sub-mode do not use the initial sub-mode command.

**debug_ip addrs 10.1.1.1** **addrs 10.1.1.2** **save**

### Where

When operating within a sub-mode, multiple changes can be made to parameters. To see the current status of the configured parameters, use the

where
command.
**debug_ip addrs 10.1.1.1** **addrs 10.1.1.2** **addrs 10.1.1.3** **where** Tenant: admin +----------+----------+ | Field | Value | +----------+----------+ | addrs[1] | 10.1.1.1 | | addrs[2] | 10.1.1.2 | | addrs[3] | 10.1.1.3 | +----------+----------+

### API

When executing any CLI command, it may include the

--api-detail
flag. This flag will echo the API call the Vantage CLI is performing, and the command executes as it would without this flag. This can be useful when building API driven automation scripts.
show serviceengine --api-detail REST API Request API: /api/serviceengine?owned_by_controller=True&join_subresources=runtime  

API echoed output may be enabled for every command executed during a single CLI session via terminal

display_api_details
.