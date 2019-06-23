#
# Cookbook:: rio_logstash
# Recipe:: config
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'rio_logstash::service'

template '/etc/logstash/conf.d/Default-Filter.conf' do
    source 'Default-Filter.conf.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[logstash.service]', :delayed
end

template '/etc/logstash/conf.d/Default-Inputs.conf' do
    source 'Default-Inputs.conf.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    variables(
        ipaddress: node['ipaddress'],
    )
    notifies :restart, 'service[logstash.service]', :delayed
end

template '/etc/logstash/conf.d/Default-Outputs.conf' do
    source 'Default-Outputs.conf.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    variables(
        elasticsearch: node['rio_logstash']['elasticsearch'],
    )
    notifies :restart, 'service[logstash.service]', :delayed
end

template '/etc/systemd/system/logstash.service' do
    source 'logstash.service.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[logstash.service]', :delayed
end