---
title: Configuring Ansible for Avi Vantage
layout: default
---
## Setup

## Installing dependencies

* Install the Avi SDK  
<pre><code class="language-lua">pip install avisdk</code></pre>  
* Install the avinetworks.avisdk Ansible role.  
<pre><code class="language-lua">ansible-galaxy install -f avinetworks.avisdk</code></pre>  For help using the module and understanding key value pairs, please refer to the  <a href="/docs/latest/api-guide/">Avi API Guide</a>. You can also find a visual representation of current values using https://<controller_ip>/api/<object>/. For example, https://10.10.27.90/api/virtualservice/. 

## Usage

This is an example playbook:

<pre><code class="language-lua">---
- hosts: localhost
  connection: local
  vars:
    controller: 10.10.27.90
    username: admin
    password: AviNetworks123!
  roles:
    - avinetworks.avisdk
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

Additional examples available at <a href="https://github.com/avinetworks/devops/tree/master/ansible">Avi Devops Github</a>.

