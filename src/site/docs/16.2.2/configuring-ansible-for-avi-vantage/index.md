---
title: Configuring Ansible for Avi Vantage
layout: default
---
## Setup

## Installing dependencies

* Install the Avi SDK  
<pre><code class="language-lua">pip install avisdk</code></pre>  
* Download the Avi fork of ansible-modules-extras   
<pre><code class="language-lua">wget https://github.com/avinetworks/ansible-modules-extras/archive/devel.tar.gz</code></pre>  
* Untar the devel.tar.gz  into Ansible directory /etc/ansible/library   
<pre><code class="language-lua">sudo mkdir -p /etc/ansible/library
tar -xvf devel.tar.gz -C /etc/ansible/library</code></pre>  

### Configure Ansible for the Module

Notes:

* Modules can be written in any language and are found in the path specified by ANSIBLE_LIBRARY= environment variable or the --module-path command line option.
* By default, everything that ships with Ansible is pulled from its source tree, but additional paths can be added.
* Find the relevant Ansible document here: <a href="http://docs.ansible.com/ansible/developing_modules.html">http://docs.ansible.com/ansible/developing_modules.html</a> 

Using the -M  parameter:

<pre><code class="language-lua">ansible-playbook -M /etc/ansible/library/ansible-modules-extras-devel/network/avi</code></pre>  

Using the ANSIBLE_LIBRARY=  environment variable:

<pre><code class="language-lua">export ANSIBLE_LIBRARY=/etc/ansible/library/ansible-modules-extras-devel/network/avi</code></pre>  

For help using the module and understanding key value pairs, please refer to the <a href="api-guide/">Avi API Guide</a>. You can also find a visual representation of current values using https://<controller_ip>/api/<object>/. For example, https://10.10.27.90/api/virtualservice/.

## Usage

This is an example playbook:

<pre><code class="language-lua">---
- hosts: localhost
  connection: local
  vars:
    controller: 10.10.27.90
    username: admin
    password: AviNetworks123!
  tasks:
  - avi_pool:
      controller: "{{ controller }}"
      username: "{{ username }}"
      password: "{{ password }}"
      name: testpool2
      state: present
      health_monitor_refs:
        - '/api/healthmonitor?name=System-HTTP'
      servers:
        - ip:
            addr: 10.90.130.8
            type: V4
        - ip:
            addr: 10.90.130.7
            type: V4
  - avi_virtualservice:
      controller: "{{ controller }}"
      username: "{{ username }}"
      password: "{{ password }}"
      name: newtestvs
      state: present
      performance_limits:
        max_concurrent_connections: 1000
      services:
        - port: 443
          enable_ssl: true
        - port: 80
      ssl_profile_ref: '/api/sslprofile?name=System-Standard'
      application_profile_ref: '/api/applicationprofile?name=System-Secure-HTTP'
      ssl_key_and_certificate_refs:
        - '/api/sslkeyandcertificate?name=System-Default-Cert'
      ip_address:
        addr: 10.90.131.103
        type: V4
      pool_ref: '/api/pool?name=testpool2'</code></pre>  

 

