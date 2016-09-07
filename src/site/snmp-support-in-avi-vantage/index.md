---
title: SNMP Support in Avi Vantage
layout: default
---
Avi Vantage supports SNMP v2c. The MIB file name is AVI-NETWORKS-MIB.my and is available for download at the following location: <a href="https://github.com/avinetworks/sdk/tree/master/mibs">https://github.com/avinetworks/sdk/tree/master/mibs</a>

The MIB file contains a description of the Avi Vantage SNMP configuration objects and notifications.

This article shows the MIB definitions for the Avi Vantage objects and the definitions for the notifications (traps). An example of how to configure a <a href="#event-based-trap">custom alert based on an SNMP notification</a> also is provided.

## Responding to SNMP Queries

To fetch SNMP objects from Avi Vantage, an external host needs to query the SNMP daemon, which only runs on the Controller cluster leader. It is therefore best to configure the external host to direct queries to the cluster IP of the Avi Controller cluster. Absent a cluster IP, the external host must know the IP addresses of *each* Controller, and try as many as three times before it finds the current leader's SNMP daemon.

Firewall rules should be configured to give that external host access to the cluster IP or each of the Controller IPs.

During the brief period of time (1-4 minutes) that a Controller cluster is recovering from the failure of its leader, queries to the cluster IP will fail, which the external host may interpret as "Vantage is down." That is only true in the narrow sense that the control plane is down; the data plane (i.e., the SEs) are likely up and delivering virtual services to clients.

## Configuration Objects

The following are the Avi Vantage configuration objects exposed through the AVI-NETWORKS-MIB.my:

* Avi Controller
* Service Engine
* Virtual Service

### Avi Controller

AviControllerEntry ::= SEQUENCE { aviControllerIndex Integer32, aviControllerUUID SnmpAdminString, aviControllerName DisplayString, aviControllerAddrType InetAddressType, aviControllerAddr InetAddress, aviControllerStatus INTEGER } aviControllerUUID : Unique UUID of the Avi Controller VM aviControllerName : Name assigned to the Avi Controller (defaults to the IP address of the Avi Controller) aviControllerAddr : Management v4 IP address of the Avi Controller aviControllerStatus : Runtime status of the Avi Controller

1

2
3

4
5

6
7

8
9

10
11

12
13

14
15

16
17  

AviControllerEntry  :: =
   SEQUENCE  {

     aviControllerIndex       Integer32 ,
       aviControllerUUID       SnmpAdminString ,

       aviControllerName       DisplayString ,
       aviControllerAddrType   InetAddressType ,

       aviControllerAddr       InetAddress ,
       aviControllerStatus     INTEGER

}
aviControllerUUID      :  Unique UUID of the Avi Controller VM

aviControllerName      :  Name assigned to  the Avi Controller  ( defaults
                           to  the IP address of the Avi Controller )

aviControllerAddr      :  Management v4 IP address of the Avi
                           Controller

aviControllerStatus  :  Runtime status of the Avi Controller
 

### Service Engine

AviServiceEngineEntry ::= SEQUENCE { aviServiceEngineIndex Integer32, aviServiceEngineUUID SnmpAdminString, aviServiceEngineName DisplayString, aviServiceEngineAddrType InetAddressType, aviServiceEngineAddr InetAddress, aviServiceEngineStatus INTEGER } aviServiceEngineUUID : Unique UUID of the Avi Service Engine VM aviServiceEngineName : Name of the Service Engine VM assigned in the Virtual Infrastructure aviServiceEngineAddr : Management v4 IP address of the Avi Service Engine VM aviServiceEngineStatus : Runtime status of the Avi Service Engine

1

2
3

4
5

6
7

8
9

10
11

12
13

14
15

16
17  

AviServiceEngineEntry  :: =
     SEQUENCE  {

       aviServiceEngineIndex       Integer32 ,
       aviServiceEngineUUID       SnmpAdminString ,

       aviServiceEngineName       DisplayString ,
       aviServiceEngineAddrType   InetAddressType ,

       aviServiceEngineAddr       InetAddress ,
       aviServiceEngineStatus     INTEGER

     }
aviServiceEngineUUID  :  Unique UUID of the Avi Service Engine VM

aviServiceEngineName  :  Name of the Service Engine VM
                           assigned in  the Virtual Infrastructure

aviServiceEngineAddr  :  Management v4 IP address of the Avi Service
                           Engine VM

aviServiceEngineStatus  :  Runtime status of the Avi Service Engine
 

### Virtual Service

AviVirtualServiceEntry ::= SEQUENCE { aviVirtualServiceIndex Integer32, aviVirtualServiceUUID SnmpAdminString, aviVirtualServiceName DisplayString, aviVirtualServiceAddrType InetAddressType, aviVirtualServiceAddr InetAddress, aviVirtualServiceStatus INTEGER } aviVirtualService UUID : Unique UUID of the virtual service aviVirtualServiceName : Name assigned to the virtual service aviVirtualServiceAddr : Virtual IP (v4) address of the virtual service aviVirtualServiceStatus : Runtime status of the virtual service

1

2
3

4
5

6
7

8
9

10
11

12
13

14
15  

AviVirtualServiceEntry  :: =
     SEQUENCE  {

       aviVirtualServiceIndex       Integer32 ,
       aviVirtualServiceUUID       SnmpAdminString ,

       aviVirtualServiceName       DisplayString ,
       aviVirtualServiceAddrType   InetAddressType ,

       aviVirtualServiceAddr       InetAddress ,
       aviVirtualServiceStatus     INTEGER

     }
aviVirtualService UUID  :  Unique UUID of the virtual service

aviVirtualServiceName  :  Name assigned to  the virtual service
aviVirtualServiceAddr  :  Virtual IP  ( v4 )  address of the virtual service

aviVirtualServiceStatus  :  Runtime status of the virtual service
 

## Notifications (traps)

The Controller cluster leader can issue SNMP trap notifications based on system events. For SNMP trap notifications to reach an external SNMP server:

* Since the leadership role can change from time to time, the external SNMP server should be configured to allow traffic from any one of the three Controllers in the cluster, i.e., all three addresses should be in the SNMP server's allowed-access list.
* The firewall rules should be configured to allow UDP traffic destined to port 162 on the SNMP trap server from any of the three cluster member's IP addresses.

System events related to the Avi Controller cluster, Avi Service Engines, virtual services and SSL certification expiry can be classified into their respective SNMP traps. Other system events use the generic SNMP trap notification to generate traps.

Avi Controller supports the following SNMP notifications (traps).

* aviControllerStatusChanged
* aviServiceEngineStatusChanged
* aviVirtualServiceStatusChanged
* aviSSLCertificateExpired
* aviSystemAlert

Note: aviSystemAlert is a generic trap notification and can be associated with any of the system events generated by the Avi Controller.

### aviControllerStatusChanged

aviControllerStatusChanged NOTIFICATION-TYPE OBJECTS { aviControllerStatus, aviOperStatusReason } STATUS current DESCRIPTION "This alert is generated when controller status Changes." ::= { aviNotificationsObjects 1 }

1

2
3

4
5

6
7

8
9

10
11

12  

aviControllerStatusChanged  NOTIFICATION - TYPE
   OBJECTS  {

   aviControllerStatus ,
   aviOperStatusReason

   }
STATUS     current

DESCRIPTION
"This alert is generated when controller status

   Changes."
:: =  {  aviNotificationsObjects  1  }

 

This trap is generated when the Avi Controller status changes.

The following Controller-state-change system events can initiate the aviControllerStatusChange trap:

* Controller-Node-Left
* Controller-Warm-Reboot
* System-Upgrade-Aborted
* System-Rollback-Aborted
* License-Expiry-Notif
* License-Usage-Servers
* License-Usage-Cores
* License-Usage-Throughput
* License-Usage-Vs

For each of the above Avi Controller status-change events, there is a default system alert configuration and for it a default alert action.

### aviServiceEngineStatusChanged

aviServiceEngineStatusChanged NOTIFICATION-TYPE OBJECTS { aviObjectURL, aviServiceEngineStatus, aviOperStatusReason } STATUS current DESCRIPTION "This alert is generated when Service Engine status Changes." ::= { aviNotificationsObjects 2 }

1

2
3

4
5

6
7

8
9

10
11

12
13  

aviServiceEngineStatusChanged  NOTIFICATION - TYPE
   OBJECTS  {

   aviObjectURL ,
   aviServiceEngineStatus ,

   aviOperStatusReason
   }

   STATUS     current
   DESCRIPTION

   "This alert is generated when Service Engine status
   Changes."

:: =  {  aviNotificationsObjects  2  }
 

This trap is generated when the Avi SE status changes.

The following Avi SE status-change events can initiate the aviServiceEngineStatusChanged trap:

* Se-Fatal-Error
* Se-Marked-Down
* Se-Vm-Deleted
* Se-Powered-Down
* Se-Rebooted
* Se-Down

For each of the above Avi SE status-change events, there is a default system alert configuration.

### aviVirtualServiceStatusChanged

aviVirtualServiceStatusChanged NOTIFICATION-TYPE OBJECTS { aviObjectURL, aviVirtualServiceStatus, aviVirtualServiceStatusReason } STATUS current DESCRIPTION "This alert is generated when virtual service status changes." ::= { aviNotificationsObjects 3 }

1

2
3

4
5

6
7

8
9

10
11

12
13  

aviVirtualServiceStatusChanged  NOTIFICATION - TYPE
   OBJECTS  {

   aviObjectURL ,
   aviVirtualServiceStatus ,

   aviVirtualServiceStatusReason
   }

   STATUS     current
   DESCRIPTION

   "This alert is generated when virtual service status
   changes."

   :: =  {  aviNotificationsObjects  3  }
 

This trap is generated when the virtual service status changes.

The following virtual service status-change events can initiate the aviVirtualServiceStatusChanged trap:

* Vs-Down
* Vs-Up

To configure SNMP traps for the Avi Controller status-change events, <a href="#event-based-trap">click here</a>.

### aviSSLCertificateExpired

aviSSLCertificateExpired NOTIFICATION-TYPE OBJECTS { aviObjectURL, aviSSLCertificateInfo } STATUS current DESCRIPTION "This alert is generated when SSL Certificate Expires." ::= { aviNotificationsObjects 4 }

1

2
3

4
5

6
7

8
9

10
11

12  

aviSSLCertificateExpired  NOTIFICATION - TYPE
OBJECTS  {

   aviObjectURL ,
   aviSSLCertificateInfo

   }
   STATUS     current

   DESCRIPTION
   "This alert is generated when SSL Certificate

   Expires."
   :: =  {  aviNotificationsObjects  4  }

 

This trap is generated when an SSL certificate expires. The following virtual service status-change event(s) can initiate the aviVirtualServiceStatusChanged trap: Ssl-Cert-Expire

To configure SNMP traps for the Avi Controller status-change events, <a href="#event-based-trap">click here</a>.

### aviSystemAlert

aviSystemAlert NOTIFICATION-TYPE OBJECTS { aviSystemAlertInfoDesc } STATUS current DESCRIPTION "This is a generic system alert" ::= { aviNotificationsObjects 5 }

1

2
3

4
5

6
7

8
9

10  

aviSystemAlert  NOTIFICATION - TYPE
OBJECTS  {

   aviSystemAlertInfoDesc
   }

   STATUS     current
   DESCRIPTION

   "This is a generic system alert"
   :: =  {  aviNotificationsObjects  5  }

 

This is a generic trap notification. It can be associated with any of the system events generated by the Avi Controller.
<a name="event-based-trap"></a>

## Configuration for SNMP Event-based Trap

This section shows the configuration for generating an SNMP trap when a Vs-Down event occurs. The workflow is described here, and also shown here:

<a href="img/Alert-Workflow-1.png"><img src="img/Alert-Workflow-1.png" alt="Alert-Workflow" width="600" height="116"></a>

 

In the following example from the Avi Controller web interface, the Vs-Down event is shown associated with a new alert action named "my-SNMP-alert-action." The default alert action System-Alert-Level-High could be modified instead. However, it is best practice to leave the system default alert action unchanged, and instead create a new, custom alert action.

<a href="img/snmp-alertconfig-workflow2.png"><img src="img/snmp-alertconfig-workflow2.png" alt="snmp-alertconfig-workflow2" width="933" height="288"></a>

In the Alert Configuration editor, the alert action is configured:
<a href="img/snmp-alertconfig-workflow3.png"><img src="img/snmp-alertconfig-workflow3.png" alt="snmp-alertconfig-workflow3" width="435" height="700"></a>

In the Alert Action editor, the named action is associated with just ***one*** type of notification, an SNMP trap. The notification is given the name “my-SNMP-trap-notification.”
<a href="img/snmp-alertconfig-workflow4.png"><img src="img/snmp-alertconfig-workflow4.png" alt="snmp-alertconfig-workflow4" width="685" height="491"></a>

The named notification is defined in the notification editor.

Note: Multiple SNMP servers are supported. (Click on the green + box to add.)
<a href="img/snmp-alertconfig-workflow5.png"><img src="img/snmp-alertconfig-workflow5.png" alt="snmp-alertconfig-workflow5" width="683" height="234"></a>
To confirm that the SNMP trap notification is defined:
<a href="img/snmp-alertconfig-workflow6.png"><img src="img/snmp-alertconfig-workflow6.png" alt="snmp-alertconfig-workflow6" width="600" height="252"></a>