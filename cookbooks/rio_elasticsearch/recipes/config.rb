#
# Cookbook:: rio_elasticsearch
# Recipe:: config
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'rio_elasticsearch::service'

template '/etc/elasticsearch/elasticsearch.yml' do
    source 'elasticsearch.yml.erb'
    action :create
    owner 'root'
    group 'elasticsearch'
    mode '0660'
    variables(
        hostname: node['fqdn'],
        ipaddress: node['ipaddress'],
        clustername: node['rio_elasticsearch']['clustername'],
        clusternodes: node['rio_elasticsearch']['clusternodes'],
        clusterquorem: node['rio_elasticsearch']['clusterquorem'],
        lockmem: node['rio_elasticsearch']['lockmem'],
        javaheapmem: node['rio_elasticsearch']['javaheapmem'],
        initialmasternode: node['rio_elasticsearch']['initialmasternode'],
    )
    notifies :restart, 'service[elasticsearch.service]', :delayed
end

template '/etc/elasticsearch/jvm.options' do
    source 'jvm.options.erb'
    action :create
    variables(
      javaheapmem: node['rio_elasticsearch']['javaheapmem'],
    )
    notifies :restart, 'service[elasticsearch.service]', :delayed
end

directory '/var/elasticsearch' do
    action :create
    owner 'elasticsearch'
    group 'elasticsearch'
    mode '0755'
end

directory '/etc/systemd/system/elasticsearch.service.d/' do
    action :create
    owner 'root'
    group 'root'
    mode '0755'
end

template '/etc/systemd/system/elasticsearch.service.d/override.conf' do
    source 'override.conf.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[elasticsearch.service]', :delayed
end