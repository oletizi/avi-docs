---
title: vRealize Orchestrator Integration
layout: default
---
This article covers connecting VMware's vRealize Orchestrator to vCenter and Avi Vantage deployments.  vRO can be used to automate tasks with Avi Vantage, such as deploying a new virtual service or editing an existing one.

See VMware's <a href="http://www.vmware.com/products/vrealize-orchestrator.html">vRO website</a> for more info on vRealize Orchestrator. The latest vRO ova can be downloaded from <a href="https://my.vmware.com/group/vmware/home">My VMware</a>. The image used for initial implementation can be downloaded from Amazon <a href="https://s3.amazonaws.com/aviswdownloads/VMware-vRO-Appliance-7.2.0.19944-4629837_OVF10.ova">S3</a>.

Avi Network's vRO package, which includes pre-built templates for configuring Avi Vantage, may be downloaded from the <a href="https://github.com/avinetworks/avi_vrealize">Avi git repo</a>.  vRO support requires at least version 16.3 of Avi Vantage.

## Connect vRO to vCenter

* Once the vRO appliance is deployed using the ova, browse to https://<VRO-IP>:8283/vco-controlcenter/#/
* Login using the root credentials provided during ova deploy.
* Click “Configure Authentication Provider.”
* Select Authentication mode as vSphere and configure as shown: <a href="img/vro1.png"><img class="wp-image-23853 aligncenter" src="img/vro1.png" alt="vro1" width="462" height="214"></a> 
    
     
    
* On the home page, click Startup Options and restart the services. 

## Log into vRO

* Browse to https://<VRO -IP>:8281/vco/
* Click “Start Orchestrator Client.” The Java client binary will be downloaded.
* Open the client.jnlp file and click ‘Run’ when prompted.
* Login using vCenter credentials (not VRO login). The host name will be VRO-IP:8281.
* Change the view to “Design” using the dropdown on top. <a href="img/vro2.png"><img class="wp-image-23855 aligncenter" src="img/vro2.png" alt="vro2" width="440" height="316"></a> 

 

## Import the Avi-VRO Package

* Download the latest com.vmware.avinetworks.plugin.dynamictypes.package from the git repo <a href="https://github.com/avinetworks/avi_vrealize">avinetworks/avi_vrealize</a>
* On the Packages tab, import the Avi package. <a href="img/vro3.png"><img class="wp-image-23857 aligncenter" src="img/vro3.png" alt="vro3" width="449" height="116"></a> 
    
     
    
* Navigate to the Workflows tab and check that the Avi Networks folder is created with all supported workflows. <a href="img/vro4.png"><img class="wp-image-23859 size-full aligncenter" src="img/vro4.png" alt="vro4" width="288" height="420"></a> 
    
     
    
# Add Avi Controller and Create Dynamic Objects

Before running any of the workflows, first create an Avi Controller object. Make sure support for HTTP basic authentication is enabled on the Avi Controller; it is disabled by default. See the following <a href="/http-basic-auth-for-api-queries/">Basic Auth KB</a> to enable. Next, write access to vCenter Cloud must be configured for the same vCenter server to which vRO is connected.

* Select “Create Avi Networks Dynamic Types” workflow under Avi Networks > Setup > Helpers <a href="img/vro5.png"><img class="size-full wp-image-23861 aligncenter" src="img/vro5.png" alt="vro5" width="328" height="479"></a> 
    
     
    
* Run the Workflow and follow steps as below:<a href="img/vro6.png"><img class="wp-image-23863 aligncenter" src="img/vro6.png" alt="vro6" width="504" height="403"><br> </a><a href="img/vro7.png"><img class="wp-image-23865 aligncenter" src="img/vro7.png" alt="vro7" width="509" height="141"><br> </a><a href="img/vro8.png"><img class="wp-image-23867 aligncenter" src="img/vro8.png" alt="vro8" width="509" height="149"></a> (Note: enter the Avi Controller URL as > , with no / at the end) 
https://<IP
    
    <a href="img/vro9.png"><img class="size-full wp-image-23869 aligncenter" src="img/vro9.png" alt="vro9" width="509" height="158"><br> </a><a href="img/vro10.png"><img class="wp-image-23871 aligncenter" src="img/vro10.png" alt="vro10" width="511" height="184"><br> </a>
    
* On the Inventory tab, Dynamic Types objects will be auto-created for all existing virtual services, pools and certificates: 
<a href="img/vro11.png"><br> <img class="wp-image-23873 aligncenter" src="img/vro11.png" alt="vro11" width="313" height="437"></a> 

## Running Workflows

Steps for running all workflows is same. This section walks through HTTPS VS creation workflow.

* Navigate to the Workflows tab.
* Run the “Create Load Balancer” under Avi Networks > Sample Workflows
* Follow the steps below to run the workflow:   
<a href="img/vro12.png"><img class="wp-image-23875 aligncenter" src="img/vro12.png" alt="vro12" width="511" height="209"></a>
    
    <a href="img/vro13.png"><img class="wp-image-23877 aligncenter" src="img/vro13.png" alt="vro13" width="511" height="126"><br> </a><a href="img/vro14.png"><img class="wp-image-23879 aligncenter" src="img/vro14.png" alt="vro14" width="514" height="125"><br> </a><a href="img/vro15.png"><img class="wp-image-23881 aligncenter" src="img/vro15.png" alt="vro15" width="516" height="153"><br> </a><a href="img/vro16.png"><img class="wp-image-23883 aligncenter" src="img/vro16.png" alt="vro16" width="517" height="169"></a>
    
* Check that the Dynamic type object for the virtual service is created on Inventory tab under your selected namespace. Refresh if it is not visible.
* Check the VS on the Avi Controller UI. 

## Editing Workflows

Each workflow is made up of many components (input parameters, Java scripts, action Java scripts, presentation, etc). Depending on what needs to be changed, one may need to edit one or more of these components.

This section walks through an example of adding load balancing algorithm as a new option exposed in the “Create Load Balancer” workflow demonstrated previously in this article.

* Edit the “Create Load Balancer” workflow.
* From the Input tab add a new variable called lbAlgo of type string: <a href="img/vro17.png"><img class="wp-image-23885 aligncenter" src="img/vro17.png" alt="vro17" width="616" height="189"><br> </a>
* From the Presentation tab the variable lbAlgo must be visible.
* Create a new step and name it.
* Drag-drop the lbAlgo variable to the new step:<a href="img/vro18.png"><img class="size-medium wp-image-23887 aligncenter" src="img/vro18.png" alt="vro18" width="300" height="259"><br> </a>
* Click on lbAlgo.
* Add a property of “Predefined answers” since we need to create a dropdown with all algorithm options.
* Add some load balancing algorithm strings to the list: 
<a href="img/vro19.png"><img class="wp-image-23889 aligncenter" src="img/vro19.png" alt="vro19" width="705" height="167"><br> </a>
* Navigate to the Schema tab and edit the “generate parameter” script: <a href="img/vro20.png"><img class="wp-image-23891 aligncenter" src="img/vro20.png" alt="vro20" width="703" height="297"></a> 
    
    <a href="img/vro23.png"><img class="size-medium wp-image-23897 aligncenter" src="img/vro23.png" alt="vro23" width="300" height="139"><br> </a>
    
* From the Visual Binding tab, drag-drop the lbAlgo variable from left margin (in parameters) to center table under IN column: <a href="img/vro21.png"><img class="wp-image-23893 aligncenter" src="img/vro21.png" alt="vro21" width="609" height="203"><br> </a>
* From the Scripting tab, edit the JavaScript to add the lbAlgo parameter to output parameter (properties_para): <a href="img/vro22.png"><img class="wp-image-23895 aligncenter" src="img/vro22.png" alt="vro22" width="646" height="170"><br> </a>
* Save the changes to the script and exit.
* Save and close the workflow. 

Now that we have read the input from the presentation form and forwarded it to next blocks in workflow, edit the *actionscript,* which adds it to the REST payload. The action *generatePoolJsonData* calls *genetrateJsonData*. Edit this genetrateJsonData actionscript.

* From the Actions tab > com.avinetworks, edit the genetrateJsonData.
* Update the script to get the lbAlgo from properties para and add it to pool json data string instead of the hardcoded string, as shown: <a href="img/vro23-1.png"><img class="wp-image-23899 aligncenter" src="img/vro23-1.png" alt="vro23" width="640" height="297"><br> </a>
* Save and exit. 

 

