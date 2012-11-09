Tayu
=======

"The role of the "tayu" is to express the emotions and the personality of the puppets."
[wikipedia](http://en.wikipedia.org/wiki/Bunraku#The_chanter.2C_.22tayu.22).

Description
-----------

A webservice to integrate PuppetDB with Rundeck

Requirements
------------

* `json`
* `sinatra`
* `builder`

Installation & Usage
--------------------

Install the gem

        $ sudo gem install tayu --no-ri --no-rdoc

Usage
-----

Run the `tayu` binary. 

Run as a service
----------------

        $ sudo wget "https://raw.github.com/sirhopcount/tayu/master/tayu.init" -O "/etc/init.d/tayu"
        $ sudo /etc/init.d/tayu start

Configuration
-------------

Tayu has a yaml-based configuration file called tayu.yml. Depending on your gem
path you can find it in the config subdirectory of your tayu installation.

The default configuration is as follows:

        :puppetdb_server: localhost
        :puppetdb_port: 8080
        :username: rundeck
        :allowed_tags:
          architecture

The options pretty much speak for them selfs. 

 *   puppetdb\_server : hostname or ip address of PuppetDB server.
 *   puppetdb\_port   : Default should be good but if you have your PuppetDB running on another port you can change it here.
 *   username        : The username passed to rundeck (used for ssh/scp connections).
 *   allowed\_tags    : Which facts should converted to tags.

Facts as Tags
-------------

Tayu gives you the ability to pass facts as tags to Rundeck. If for example you 
have created an custom fact called location you can pass this as an tag by 
adding it to the allowed\_tags option.

       :allowed_tags:
          location

Tayu will then pass the fact as an tag to Rundeck.

           <node name="exampleserver.lan"
                type="Node"
                description="exampleserver.lan"
                osArch="Linux"
                osFamily="unix"
                osName="Ubuntu"
                tags="amsterdam"
                osVersion="12.04"
                username="rundeck"
                hostname="exampleserver.lan"/>

Author
------

Adrian van Dongen  <github@goodfellasonline.nl>

License
-------

    Author:: Adrian van Dongen (<github@goodfellasonline.nl>)
    Copyright:: Copyright (c) 2012 Adrian van Dongen
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

