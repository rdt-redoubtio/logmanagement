#
# Cookbook:: rio_kibana
# Recipe:: config
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'rio_kibana::service'

template '/etc/kibana/kibana.yml' do
    source 'kibana.yml.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    variables(
        ipaddress: node['ipaddress'],
        hostname: node['fqdn'],
        kibanaport: node['rio_kibana']['kibanaport'],
        elasticsearch: node['rio_kibana']['elasticsearch'],
    )
    notifies :restart, 'service[kibana.service]', :delayed
end