Service Engines are created within a group, which contains the definition of how the SEs should be sized, placed, and made highly available. Each [cloud](/docs/architectural-overview/infrastructure/#Clouds) will have at least one SE group.  The options within an SE group may vary based on the type of cloud within which they exist and its settings, such as[ _no access_](/orchestrator-access-modes/) versus [_write access_](/orchestrator-access-modes/) mode.  SEs may only exist within one group.  Each group acts as an isolation domain.  SE resources within an SE group may be moved around to accommodate virtual services, but SE resources are never shared between SE groups. Changes made to an SE group may be applied immediately, only applied to SEs created after the changes are made, or require existing SEs to first be [disabled](/disable-se/) before the changes can take effect. Multiple SE groups may exist within a cloud.  A newly created virtual service will be placed on the default SE group, though this can be changed via the VS > Advanced page while creating a VS via the advanced mode.  To move an existing virtual service from one SE group to another, the VS must first be disabled, moved, and then re-enabled.  SE groups provide data plane isolation, therefore moving a VS from one SE group to another is disruptive to existing connections through the virtual service. [![legacy-ha-gui1](/wp-content/uploads/2016/04/legacy-ha-gui1.png)](/wp-content/uploads/2016/04/legacy-ha-gui1.png)

### <span id="SE_Group_Basic_Settings_Tab">SE GROUP — BASIC SETTINGS TAB</span>

To access the Service Engine group page, navigate to Infrastructure > Clouds > -cloudname- > Service Engine Group.

#### REAL-TIME METRICS

[![Avi SE group metrics update frequency](/wp-content/uploads/2016/08/SE-group-name-metric-update-frequency.png)](/wp-content/uploads/2016/08/SE-group-name-metric-update-frequency.png) At the very top of the Basic Settings tab, besides the SE group name, you can specify XXXXXXXXXX. First, enable real-time metrics by clicking the check box. Specify an infinite time by entering a time of 0; otherwise real-time metrics will be enabled for the number of minutes specified.

#### <span id="High_Availability_Settings">HIGH AVAILABILITY & PLACEMENT SETTINGS</span>

[![Avi Vantage service engine group high availability and placement settings](/wp-content/uploads/2016/08/HA-and-placement-settings.16.2.1.png)](/wp-content/uploads/2016/08/HA-and-placement-settings.16.2.1.png) The high availability mode of the SE group controls the behavior of the SE group in the event of an SE failure.  It also controls how load is scaled across SEs. Selecting a particular HA mode will change the settings and options that are exposed in the UI. These modes span a spectrum, from use of the fewest virtual machine resources on one end to providing the best high availability on the other.

*   [Legacy Active Standby HA Mode](/legacy-ha/):  This mode is primarily intended to mimic a legacy appliance load balancer for easy migration to Avi Vantage.  Only two Service Engines may be created.  For every virtual service active on one, there is a standby on the other, configured and ready to take over in case of a failure of the active SE.  There is no Service Engine scale out in this HA mode.
*   [Elastic N + M HA Mode](/cluster-ha-for-avi-service-engines/):  This default mode permits up to N active SEs to deliver virtual services, with the capacity equivalent of M SEs within the group ready to absorb SE(s) failure(s).
*   [Elastic Active/Active HA Mode](/cluster-ha-for-avi-service-engines/):  This HA mode distributes virtual services across a minimum of two SEs.

For additional considerations for SE high availability, including VS placement, see [Overview of Vantage High Availability](/overview-of-vantage-high-availability/). To compare the above HA modes to those defined prior to Vantage 16.2, see [Comparing Past and Present SE Group HA Modes](/comparing-past-and-present-se-group-ha-modes/). **Per Application:** Select this option to deploy dedicated load balancers per application, i.e., per virtual service. In this mode, each SE is limited to a maximum of 2 virtual services. vCPUs in per-app SEs count towards licensing at 25% rate. **Virtual Services per Service Engine:** Set this to the maximum number of virtual services the Controller cluster can place on any one of the SEs in the group.

#### <span id="Service_Engine_Capacity_and_Limit_Settings">SERVICE ENGINE CAPACITY AND LIMIT SETTINGS[![Avi Vantage service engine group capacity and limit settings](/wp-content/uploads/2016/08/SE-capacity-and-limit-settings.png)](/wp-content/uploads/2016/08/SE-capacity-and-limit-settings.png)</span>

*   **Max Number of Service Engines**:  Defines the maximum SEs that may be created within an SE group. This number, combined with the virtual services per SE setting, dictate the maximum number of virtual services that can be created within an SE group. If this limit is reached, it is possible new virtual services may not be able to be deployed and will show a gray, un-deployed status. This setting can be useful to prevent Vantage from consuming too many virtual machines.
*   **Memory per Service Engine**:  [Default = 2 GB, min = 1 GB] Enter the amount of RAM, in multiples of 1024 MB, to allocate to all new SEs. Changes to this field will only affect newly-created SEs. Allocating more memory to an SE will allow larger HTTP cache sizes, more concurrent TCP connections, better protection against certain DDoS attacks, and increased storage of un-indexed logs. This option is only applicable in write access mode deployments.
*   **Memory Reserve**:  Reserving memory ensures an SE will not have contention issues with over-provisioned host hardware. Reserving memory makes that memory unavailable for use by another virtual machine, even when the virtual machine that reserved those resources is powered down. Avi strongly recommends reserving memory, as memory contention may randomly overwrite part of the SE memory, destabilizing the system. This option is applicable only for deployments in write access mode. For deployments in read access mode deployments or no access mode, memory reservation for the SE VM must be configured on the virtualization orchestrator.
*   **vCPU per Service Engine**:  [Default = 2] Enter the number of virtual CPU cores to allocate to new SEs. Changes to this setting do not affect existing SEs. This option is only applicable in write access mode. Adding CPU capacity will help with computationally expensive tasks, such as SSL processing or HTTP compression.
*   **CPU Reserve**:  Reserving CPU capacity with a virtualization orchestrator ensures a SE will not have issues with over-provisioned host hardware. Reserving CPU cores makes those cores unavailable for use by another virtual machine, even when the virtual machine that reserved those resources is powered down. This option is only applicable in write access mode deployments.
*   **Disk per Service Engine:** [min = 10 GB] Specify an integral number of GB of disk to allocate to all new SEs.This option is only applicable in write access mode deployments. The value appearing in the window is either:
    *   10 GB (the absolute minimum allowed), or
    *   a value calculated as follows: 5 GB + 2 _x_ memory-per-SE, or
    *   some higher number previously auto-calculated by the UI, or
    *   some number you explicitly key in (values less than 5 GB + 2 _x_ memory-per-SE will be rejected)

*   **Connection Memory Percentage:** The percentage of memory reserved to maintain connection state. It comes at the expense of memory used for HTTP in-memory cache. Sliding the bar causes the percentage to range between its limits, 10% minimum and 90% maximum.

#### <span id="Virtual_Service_PlacementPolicy">VIRTUAL SERVICE PLACEMENT POLICY[![Screen Shot 2016-07-18 at 3.59.40 PM](/wp-content/uploads/2016/07/Screen-Shot-2016-07-18-at-3.59.40-PM.png)](/wp-content/uploads/2016/07/Screen-Shot-2016-07-18-at-3.59.40-PM.png)</span>

*   **Auto-Rebalance**:  When disabled, Vantage will generate an event when the Controller recommends migrating a virtual service to a different Service Engine, scaling in SE capacity, or scaling out SE capacity.  When checked, the Controller will generate an event and also take the recommended action.  This option applies to the elastic HA modes only. See[ Autoscale Service Engines](/autoscale-service-engines/) for more info on the criteria that triggers these recommendations.
*   **Compact Placement**: When compact placement is ON (previously referred to as "Compactor"), Vantage uses the minimum number of SEs required. When it is OFF, Vantage will use as many SEs as required, up to the limit allowed by Max Number of Service Engines. By default, compact placement is ON for elastic HA N+M mode and OFF for elastic HA active/active mode.

### <span id="SE_GroupAdvanced_Tab">SE GROUP — ADVANCED TAB</span>

The advanced tab in the Service Engine group popup allows configuration of optional functionality for SE groups. This tab only exists for VMware clouds configured with write access mode. The appearance of some fields is contingent upon selections made. [![Advanced SE Settings](/wp-content/uploads/2016/07/Advanced-SE-Settings.png)](/wp-content/uploads/2016/07/Advanced-SE-Settings.png)

*   **Service Engine Name Prefix**:  Enter the prefix to use when naming the SEs within the SE group. This name will be seen both within Vantage, and as the name of the virtual machine within the virtualization orchestrator.
*   **Service Engine Folder**:  SE Virtual Machines for this SE group will be grouped under this folder name within the virtualization orchestrator.
*   **Delete Unused Service Engines After**:  Enter the number of minutes to wait before the Controller deletes an unused SE. Traffic patterns can change quickly, and a virtual service may therefore need to scale across additional SEs with little notice. Setting this field to a high value ensures that Vantage keeps unused SEs around in case of a sudden spike in traffic. A shorter value means the Controller may need to recreate a new SE to handle a burst of traffic, which may take a couple of minutes. This option is only applicable in write access mode.

#### <span id="Host_Data_Store_Scope">HOST & DATA STORE SCOPE</span>

*   **Host Scope Service Engine**:  SEs may be deployed on any host that most closely matches the resources and reachability criteria for placement. This setting directs the placement of SEs.
    *   **Any**:  The default setting allows SEs to be deployed to any host that best fits the deployment criteria.
    *   **Cluster**:  Excludes SEs from deploying within specified clusters of hosts. Checking the Include checkbox reverses the logic, ensuring SEs only deploy within specified clusters.
    *   **Host**:  Excludes SEs from deploying on specified hosts. The Include checkbox reverses the logic, ensuring SEs only be deploy within specified hosts.
*   **Data Store Scope for Service Engine Virtual Machine**:  Set the storage location for SEs. Storage is used to store the OVA (vmdk) file for VMware deployments.
    *   **Any**:  Vantage will determine the best option for data storage.
    *   **Local**:  The SE will only use storage on the physical host.
    *   **Shared**:  Vantage will prefer using the shared storage location. Specific data stores may be Excluded or specified via Include.

#### <span id="Placement">PLACEMENT</span>

*   **Use Default Management Network**:  If the SEs require a different network for management than the Controller, it must be specified here. The SEs will use their management route to establish communications with the Controllers.  See [Deploy SEs in Different Datacenter from Controllers](/deploy-ses-in-different-data-centers-from-controllers/)

#### <span id="Security">SECURITY</span>

*   **HSM Group**:  Hardware security modules may be configured within the Templates > Security > HSM Groups.  An HSM is an external security appliance that is used for secure storage of SSL certificates and keys.  The HSM Group dictates how Service Engines can reach and authenticate with the HSM.  See [Physical Security for SSL Keys](/physical-security-for-ssl-keys/)