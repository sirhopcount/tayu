#
# Copyright 2012, Adrian van Dongen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'sinatra'
require 'json'
require 'rest_client'
require 'builder/xchar'

class Tayu < Sinatra::Base

    class << self
        attr_accessor :puppetdb_server
        attr_accessor :puppetdb_port
        attr_accessor :allowed_tags
        attr_accessor :username
    end

    ## convert to string and then to XML escaped text.
    def xml_escape(input)
        return input.to_s.to_xs
    end

    ## retrieve all nodes from puppetdb and return then as an array
    def get_nodes
	q = '["=", ["node", "active"], true]'

	if ! q.is_a? String then
		q=JSON[q]
		end
	params = {:query => q}

        response_nodelist = RestClient.get"http://#{Tayu.puppetdb_server}:#{Tayu.puppetdb_port}/nodes",  { :accept => :json, :params => params }
        return JSON.parse(response_nodelist)
    end 

    ## retrieve all facts for specified node and return them as an hash
    def get_facts(nodename)
        facts_puppetdb = Hash.new
        response_facts = RestClient.get"http://#{Tayu.puppetdb_server}:#{Tayu.puppetdb_port}/facts/" + nodename, { :accept => :json}

        # json string holds two object, we only need te facts object
        json_object = JSON.parse(response_facts)
        json_object.each do |key, value|
            if key == 'facts'
                facts_puppetdb = value
            end
        end 
        return facts_puppetdb
    end

    ## generate xml document body based on retrieved nodes and there facts
    def generate_body
        xmlbody = %Q(<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE project PUBLIC "-//DTO Labs Inc.//DTD Resources Document 1.0//EN" "project.dtd">\n<project>\n)
    
        # for each node get the facts 
        get_nodes.each do |node|
            facts = get_facts(node)
            tags_config = Tayu.allowed_tags 
            tags_rundeck = Array.new 
            os_family = facts["kernel"] =~ /windows/i ? 'windows' : 'unix'

            # check if value is empty if not add to array
            tags_config.each do |tag|
                if !facts[tag].nil?
                    tags_rundeck << facts[tag]
                end
            end

            # xml body
            xmlbody << <<-EOH
            <node name="#{xml_escape(facts["fqdn"])}"
                type="Node"
                description="#{xml_escape(facts["fqdn"])}"
                osArch="#{xml_escape(facts["kernel"])}"
                osFamily="#{xml_escape(os_family)}"
                osName="#{xml_escape(facts["operatingsystem"])}"
                tags="#{xml_escape(tags_rundeck.join(','))}"
                osVersion="#{xml_escape(facts["operatingsystemrelease"])}"
                username="#{xml_escape(Tayu.username)}"
                hostname="#{xml_escape(facts["fqdn"])}"/>
    EOH
        end

        # close xml body and return results
        xmlbody << "</project>"
        return xmlbody
    end

    ## index page 
    get '/' do

        # set document type to xml
        response['Content-Type'] = 'text/xml'

        # Generate xml body and display it
        body = generate_body
        body

    end

    ## 404 page
    not_found do
       status 404  
       'page not found' 
    end

end
