Tayu
=======

"The role of the "tayu" is to express the emotions and the personality of the puppets."
[wikipedia](http://en.wikipedia.org/wiki/Bunraku#The_chanter.2C_.22tayu.22).

Description
-----------

A webservice to intergrate PuppetDB with Rundeck

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

