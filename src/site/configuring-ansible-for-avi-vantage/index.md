---
title: Configuring Ansible for Avi Vantage
layout: default
---
## Setup

## Installing dependencies

* Install the Avi SDK
pip install avisdk

1 pip install avisdk

* Download the Avi fork of ansible-modules-extras
wget https://github.com/avinetworks/ansible-modules-extras/archive/devel.tar.gz

1 wget https : / / github .com / avinetworks / ansible - modules - extras / archive / devel .tar .gz

* Untar the devel.tar.gz into Ansible directory /etc/ansible/library
sudo mkdir -p /etc/ansible/library tar -xvf devel.tar.gz -C /etc/ansible/library

1

2 sudo mkdir  - p  / etc / ansible / library

tar  - xvf devel .tar .gz  - C  / etc / ansible / library

### Configure Ansible for the Module

Notes:

* Modules can be written in any language and are found in the path specified by ANSIBLE_LIBRARY= environment variable or the --module-path command line option.
* By default, everything that ships with Ansible is pulled from its source tree, but additional paths can be added.
* Find the relevant Ansible document here: <a href="http://docs.ansible.com/ansible/developing_modules.html">http://docs.ansible.com/ansible/developing_modules.html</a>

Using the -M  parameter:
ansible-playbook -M /etc/ansible/library/ansible-modules-extras-devel/network/avi

1 ansible - playbook  - M  / etc / ansible / library / ansible - modules - extras - devel / network / avi

Using the ANSIBLE_LIBRARY=  environment variable:

export ANSIBLE_LIBRARY=/etc/ansible/library/ansible-modules-extras-devel/network/avi

1 export ANSIBLE_LIBRARY = / etc / ansible / library / ansible - modules - extras - devel / network / avi

For help using the module and understanding key value pairs, please refer to the <a href="/docs/latest/api-guide/">Avi API Guide</a>. You can also find a visual representation of current values using https://<controller_ip>/api/<object>/. For example, https://10.10.27.90/api/virtualservice/.

## Usage

This is an example playbook:
--- - hosts: localhost connection: local vars: controller: 10.10.27.90 username: admin password: AviNetworks123! tasks: - avi_pool: controller: "{{ controller }}" username: "{{ username }}" password: "{{ password }}" name: testpool2 state: present health_monitor_refs: - '/api/healthmonitor?name=System-HTTP' servers: - ip: addr: 10.90.130.8 type: V4 - ip: addr: 10.90.130.7 type: V4 - avi_virtualservice: controller: "{{ controller }}" username: "{{ username }}" password: "{{ password }}" name: newtestvs state: present performance_limits: max_concurrent_connections: 1000 services: - port: 443 enable_ssl: true - port: 80 ssl_profile_ref: '/api/sslprofile?name=System-Standard' application_profile_ref: '/api/applicationprofile?name=System-Secure-HTTP' ssl_key_and_certificate_refs: - '/api/sslkeyandcertificate?name=System-Default-Cert' ip_address: addr: 10.90.131.103 type: V4 pool_ref: '/api/pool?name=testpool2'

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

18
19

20
21

22
23

24
25

26
27

28
29

30
31

32
33

34
35

36
37

38
39

40
41

42
43 ---

- hosts : localhost
   connection : local

   vars :
     controller : 10.10.27.90

     username : admin
     password : AviNetworks123!

   tasks :
   - avi_pool :

       controller : " { { controller  } } "
      username: " { { username  } } "

      password: " { { password  } } "
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
      controller: " { { controller  } } "

      username: " { { username  } } "
      password: " { { password  } }"

       name : newtestvs
       state : present

       performance_limits :
         max_concurrent_connections : 1000

       services :
         - port : 443

           enable_ssl : true
         - port : 80

       ssl_profile_ref : '/api/sslprofile?name=System-Standard'
       application_profile_ref : '/api/applicationprofile?name=System-Secure-HTTP'

       ssl_key_and_certificate_refs :
        -  '/api/sslkeyandcertificate?name=System-Default-Cert'

       ip_address :
         addr : 10.90.131.103

         type : V4
       pool_ref : '/api/pool?name=testpool2'

 