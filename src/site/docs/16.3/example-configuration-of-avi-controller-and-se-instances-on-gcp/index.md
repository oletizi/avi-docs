---
title: Example Configuration of Avi Controller and SE Instances on GCP
layout: default
---
Refer to <a href="https://cloud.google.com/docs/">Google Cloud Platform documentation</a> for Google's latest and detailed information regarding configuration of instances.

This article is referenced by <a href="/ipam-services-for-applications-running-on-instances-in-google-cloud-platform/">IPAM Services for Applications Running on Instances in Google Cloud Platform</a>.

## Setting Up gcloud Client Account on the Local Machine

 

Follow the steps given in <a href="https://cloud.google.com/sdk/docs/quickstart-linux">this Linux QuickStart to install the GCP Cloud SDK.</a>

Follow the steps below to initialize the client machine to invoke the Google Client APIs.


<pre class="command-line language-bash" data-prompt="1|$" data-output="2-99"><code>gcloud init
Welcome! This command will take you through the configuration of gcloud.

Pick configuration to use:
[1] Re-initialize this configuration [
   
  <existing-config>
    ] with new settings [2] Create a new configuration [3] Switch to and re-initialize existing configuration: [default] Please enter your numeric choice:  2 Enter configuration name. Names start with a lowercase letter and contain only lowercase letters a-z, digits 0-9, and hyphens '-':  gcp-project1 Your current configuration has been set to: [gcp-project1] Network diagnostic detects and fixes local network connection issues. Checking network connection...done. ERROR: Reachability Check failed. Cannot reach https://www.google.com (SSLHandshakeError) Network connection problems may be due to proxy or firewall settings. Do you have a network proxy you would like to set in gcloud (Y/n)? Y 
  </existing-config></code></pre> Notes: 

* The user has chosen option 2 ("Create a new configuration") above.
* Your configuration may vary depending on how Internet access is set up in your network. 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>Select the proxy type:
[1] HTTP
[2] HTTP_NO_TUNNEL
[3] SOCKS4
[4] SOCKS5
Please enter your numeric choice:  2

Enter the proxy host address:

Enter the proxy port:

Is your proxy authenticated (y/N)? n

Cloud SDK proxy properties set.

Rechecking network connection...done.
Reachability Check now passes.
Network diagnostic (1/1 checks) passed.

Choose the account you would like use to perform operations for this configuration:
[1] nnnnnnnnnn-compute@developer.gserviceaccount.com
[2] Log in with a new account
Please enter your numeric choice:  2

Go to the following link in your browser:
https://accounts.google.com/o/oauth2/authredirect_uri=urn%3Aietf%3Awg%3Aoauuth%3A2.0%3Aoob&amp;prompt=select_account&amp;response_type=code&amp;client_id=32555940559.appps.googleusercontent.com&amp;scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinffo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauuth%2Fcompute&amp;access_type=offline

Enter verification code: 4/tmA8OXHgo96WZbn0ITWuyN_WNygrVo3_kXAb5XPnU6Q
You are logged in as: [].

Pick cloud project to use:
[1] gcp-project1
Please enter numeric choice or text value (must exactly match list item):  1

Your current project has been set to: [gcp-project1].

Do you want to configure Google Compute Engine
(https://cloud.google.com/compute) settings (Y/n)? Y

Which Google Compute Engine zone would you like to use as project default?

If you do not specify a zone via a command line flag while working
with Compute Engine resources, the default is assumed.
[1] asia-east1-b
[2] asia-east1-a
[3] asia-east1-c
[4] europe-west1-b
[5] europe-west1-d
[6] europe-west1-c
[7] us-central1-a
[8] us-central1-f
[9] us-central1-c
[10] us-central1-b
[11] us-east1-d
[12] us-east1-b
[13] us-east1-c
[14] us-west1-a
[15] us-west1-b
[16] Do not set default zone

Please enter numeric choice or text value (must exactly match list item):  7

Your project default Compute Engine zone has been set to [us-central1-a].
You can change it by running [gcloud config set compute/zone NAME].

Created a default .boto configuration file at [/home//.boto]. See this file and [https://cloud.google.com/storage/docs/gsutil/commands/config] for more
information about configuring Google Cloud Storage.
Your Google Cloud SDK is configured and ready to use!</code></pre> 

## Setting up the Avi Controller and SE Instances

<ol> 
 <li>Create a new network and subnet.</li> 
</ol> 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>gcloud compute networks create net1 --mode custom
gcloud compute networks subnets create <strong>net1-subnet1</strong> --network <strong>net1</strong> --range <strong>10.x.x.x/y</strong>

$ gc networks list

NAME     MODE    IPV4_RANGE  GATEWAY_IPV4
default  auto
net1     custom
$ gcloud compute networks subnets list
NAME          REGION        NETWORK  RANGE
default       asia-east1    default  10.140.0.0/20
default       us-central1   default  10.128.0.0/20
net1-subnet1  us-central1   net1     10.8.0.0/24
default       europe-west1  default  10.132.0.0/20
default       us-east1      default  10.142.0.0/20</code></pre> <ol start="2"> 
 <li>Add a firewall rule to allow tcp,udp,icmp traffic within network and http/https from outside.</li> 
</ol> 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>$ gcloud compute firewall-rules create <strong>net1-internal</strong> --allow tcp,udp,icmp --network <strong>net1</strong>
$ gcloud compute firewall-rules create <strong>net1-http</strong> --allow tcp:80 --network <strong>net1</strong> --target-tags http-server
$ gcloud compute firewall-rules create net1-https --allow tcp:443 --network <strong>net1</strong> --target-tags https-server

$ gcloud compute firewall-rules list
NAME                    NETWORK  SRC_RANGES    RULES                         SRC_TAGS  TARGET_TAGS
default-allow-http      default  0.0.0.0/0     tcp:80  http-server
default-allow-https     default  0.0.0.0/0     tcp:443 https-server
default-allow-icmp      default  0.0.0.0/0     icmp
default-allow-internal  default  10.128.0.0/9  tcp:0-65535,udp:0-65535,icmp
default-allow-rdp       default  0.0.0.0/0     tcp:3389
default-allow-ssh       default  0.0.0.0/0     tcp:22
fnet1                   net1     10.0.0.0/8    tcp,udp,icmp
fnet1-allow-http        net1     0.0.0.0/0     tcp:80 http-server
fnet1-allow-https       net1     0.0.0.0/0     tcp:443 https-server
fnet1-ssh               net1     0.0.0.0/0     tcp:22</code></pre> 

If the Avi Controller is setup as a cluster, additional rules will have to be provisioned to allow cluster members to communicate among each other.

For details on ports that need to be opened, refer to the KB titled <a href="/protocol-ports-used-by-avi-vantage-for-management-communication/">Protocol Ports Used by Avi Vantage for Management Communication</a>

* Spawn a 4-core instance for Avi Controller with tags http-server & https-server to allow outside connection and scope compute-rw to allow GCP route programming. 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>gcloud compute instances create instance-1 --boot-disk-size 80 --image-family centos-7 --image-project centos-cloud --machine-type n1-standard-4 --subnet net1-subnet1 --scopes compute-rw --tags http-server,https-server</code></pre> 
* Spawn two (or any number of) one(or more)-core instances for Avi SEs with can-ip-forward to allow proxying and tag http-server to allow traffic from outside clients via target-instances. 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>gcloud compute instances create instance-2 instance-3 --boot-disk-size 20 --can-ip-forward --image-family centos-7 --image-project centos-cloud --machine-type n1-standard-1 --subnet net1-subnet1 --scopes compute-ro --tags http-server</code></pre> 
* Spawn 2 more instances — one for client and one for server. 
<pre class="command-line language-bash" data-prompt=": >" data-output="1-99"><code>gcloud compute instances create instance-4 instance-5 --boot-disk-size 20 --image-family centos-7 --image-project centos-cloud --machine-type g1-small --subnet net1-subnet1

$ gcloud compute instances list

NAME        ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP      STATUS
i1   us-central1-b   n1-standard-4   10.8.0.4 104.197.76.25 RUNNING
i2   us-central1-b  n1-standard 1  10.8.0.5  173.255.112.36   RUNNING
i3   us-central1-b   n1-standard-1  10.8.0.6  130.211.128.252  RUNNING
i4  us-central1-b   g1-small 10.8.0.3     130.211.195.148  RUNNING
i5   us-central1-b   g1-small  10.8.0.2     104.155.183.61   RUNNING</code></pre> 