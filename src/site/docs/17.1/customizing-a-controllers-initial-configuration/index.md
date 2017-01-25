---
title: Customizing a Controller’s Initial Configuration
layout: layout171
---
Often there is a need to deploy multiple Avi Controller cluster instances starting from some common initial single Controller configuration that differs from the factory-default settings. This can be achieved by creating a JSON file with the required object definitions and then using it during deployment of subsequent Controllers, which, as leaders, can then add followers to become clusters. At the end of the process, the result is a set of identically initialized Controller clusters, ready to be individualized as needed.

## Creating <code>setup.json</code>

In most cases, these objects can be created by referring to the <a href="/docs/latest/api-guide/">Avi REST API Guide</a>.

The example below updates the system configuration by adding 8.8.8.8 to the DNS configuration:
<code></code>

<pre><code class="language-lua">{
    "SystemConfiguration": [
        {
            "dns_configuration": {
                "search_domain": "",
                "server_list": [
                    {
                        "type": "V4",
                        "addr": "8.8.8.8"
                    }
                ]
            }
        }
    ]
}</code></pre>  

 

In the case of complex objects such as <code>SSLKeyAndCertificate</code> object, the JSON file can be created by running a <code>diff</code> command against two configuration files. In a typical deployment, it is recommended to generate <code>setup.json</code> on a test controller environment. This generated file can then by used a template for actual deployments.
An Avi Controller configuration snapshot can be taken using the <code>export</code> CLI command:
<code></code>

<pre><code class="language-lua">&gt; export configuration file before.cfg
Please enter the passphrase to encrypt configuration:
Downloaded the attachment to before.cfg
Completed writing the export configuration to before.cfg</code></pre>  

 

<code></code>
At this point, configuration objects can be created using the UI or CLI. After making necessary changes using the UI/CLI configuration, a snapshot is taken once again:
<code></code>

<pre><code class="language-lua">&gt; export configuration file after.cfg
Please enter the passphrase to encrypt configuration:
Downloaded the attachment to after.cfg
Completed writing the export configuration to after.cfg</code></pre>  

<code></code>
Beyond this, configuration diff can be taking using a Python script Avi Networks has written expressly for the purpose of customizing another Controller's initial configuration:
<code></code>

<pre><code class="language-lua">/opt/avi/scripts/diff_config.py -f before.cfg -t after.cfg &gt; setup.json</code></pre>  

 

In case there is a need to encrypt the user passwords while creating <code>setup.json</code> with “User” object, user passwords can be encrypted using the following:
<code></code>

<pre><code class="language-lua">/opt/avi/scripts/avi_passwd_tool.py --password admin --salt fF6ngAb3pvPgpbkdf2_sha256$100000$fF6ngAb3pvPg$ijkEue1M9fR/qsLVgzvPe7N0VvOxIjDiJVmK9NIx+0Q=$6$fF6ngAb3pvPg$CqAKtNRZtgXtJchrPmoxUgdLFM7rFGmta1tWb7sobQI4iSZAY2QuAOBNtboVGrmDYPMCvqXXH6lARr9RedCJT.</code></pre>  

## Deployment Using <code>setup.json</code>

As a best practice, it is recommended to take a configuration backup before deploying the Controller using <code>setup.json</code> file created by the Python script. The following command will take an encrypted backup of the existing configuration.
<code></code>

<pre><code class="language-lua">/opt/avi/python/bin/portal/manage.py export_configuration --file ~/setup-old.json --passphrase secret</code></pre>  

### For a Mesos/Bare-Metal Deployment:

<code>setup.json</code> needs to be copied to the persistent directory in the host that is mounted as /vol in the controller container. If you are using avi_baremetal script, the default location is /opt/avi/controller/data on the host. When deploying the Controller as container, <code>setup.json</code> can be passed as an additional argument to <code>avi_baremetal_setup.py</code> script. For example:
<code></code>

<pre><code class="language-lua">./avi_baremetal_setup.py -c -cc 4 -cm 12 -i 10.10.22.108 -m 10.10.22.108 --setup-json /root/configs/avi-setup.json</code></pre>  

### For a Controller Deployment as a VM:

Wait until Controller comes up. Place the config file on the Controller as /var/lib/avi/etc/setup.json (note the filename). Upon reboot/fresh-start, the Avi Controller will self-configure using the provided <code>setup.json</code> file.

<pre><code class="language-lua">reboot</code></pre>  

### For an OpenStack Deployment:

UserData config size is limited to 48 Kb. If size of <code>setup.json</code> is within allowable limits:
<code></code>

<pre><code class="language-lua">&gt;# cfgdrv userdata
&gt;nova boot --config-drive true --image avicontroller --key-name mykey --flavor 4 --user-data /root/my-avi-config.json --nic net-id=7402bf4f-240f-4172-99c1-90000ea45f86 avicontrollers

&gt;# metasvc userdata
&gt;nova boot --config-drive false --image avicontroller --key-name mykey --flavor 4 --user-data /root/my-avi-config.json --nic net-id=7402bf4f-240f-4172-99c1-90000ea45f86 avicontrollers</code></pre>  

If <code>setup.json</code> size is bigger then than the allowable limit, <code>setup.json</code> can be uploaded and referred in the deployment phase.

UserData can refer to the file either using "url" or "file" tag. Example of my-avi-config-url.json with URL: <code></code>

<pre><code class="language-lua">{
 "META": {
 "init_config": {
 "url": "https://s3-us-west-2.amazonaws.com/avi-controller-configs/linuxserver-awsipam-setup.json",
     }
   } 
}</code></pre>  

Example of my-avi-config-url.json with filepath:
<code></code>

<pre><code class="language-lua">{
 "META": {
 "init_config": {
     "file": "/vol/linuxserver-awsipam-setup.json"     
     }
   } 
}</code></pre>  

For deployment:

<pre><code class="language-lua">&gt;# cfgdrv userdata indirection
&gt;nova boot --config-drive true --image avicontroller --key-name mykey --flavor 4 --user-data /root/my-avi-config-url.json --nic net-id=7402bf4f-240f-4172-99c1-90000ea45f86 --min-count=3 --max-count=3 avicontrollers

&gt;# metasvc userdata indirection
nova boot --config-drive false --image avicontroller --key-name mykey --flavor 4 --user-data /root/my-avi-config-url.json --nic net-id=7402bf4f-240f-4172-99c1-90000ea45f86 --min-count=3 --max-count=3 avicontrollers</code></pre>  

### For an AWS Deployment:

UserData config size is limited to 16Kb. If size of <code>setup.json</code> is within allowable limits, cut-paste the my-avi-config.json into the user-data section during launch from AWS Web Console
<code></code>

<pre><code class="language-lua"># metasvc userdata
 ec2-run-instances ami-b7ea27d7 -f /root/my-avi-config.json -t c4.2xlarge -s subnet-62f1b707 -g sg-642d8d02</code></pre>  

 

<code></code>
If <code>setup.json</code> size is bigger then than the allowable limit, cut-paste the my-avi-config-url.json into the user-data section during launch from AWS Web Console.
<code></code>

<pre><code class="language-lua"># metasvc userdata indirection
ec2-run-instances ami-b7ea27d7 -f /root/my-avi-config-url.json -t c4.2xlarge -s subnet-62f1b707 -g sg-642d8d02</code></pre>  

 

<code></code>
<code>my-avi-config-url.json</code> has follow similar formats as discussed in the OpenStack section. Along with that, here is a sample my-avi-config-url.json file for S3 bucket:
<code></code>

<pre><code class="language-lua">{
 "META": {
 "init_config": {
 "s3": "avi-controller-configs/linuxserver-awsipam-setup.json",
     }
   } 
}</code></pre>  

 

<code></code>
For uploading <code>setup.json</code> on S3 bucket:

* Public : use the 'url' style or 's3' style
* Private via RBAC on VM: use the 's3' style. The VM role should have s3:GetObject action allowed for it to be able to s3-get the object using IAM.
* Private via RBAC on S3-bucket: use the 's3' style. The VM role should have AWS access. The S3 bucket should have permissions for the account or user or VM role to download the object. 

Example bucket policy:
<code></code>


<pre><code class="language-lua">{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Sid": "AddPerm",
       "Effect": "Allow",
       "Principal": {
       "AWS": [
         "arn:aws:iam::139284885014:role/BM-AviController-Role",
         "arn:aws:iam::139284885014:root"
          ]
        },
       "Action": "s3:*",
       "Resource": "arn:aws:s3:::avi-controller-configs/*"
     }
   ]
 }</code></pre>  