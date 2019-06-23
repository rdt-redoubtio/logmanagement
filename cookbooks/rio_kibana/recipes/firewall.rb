#
# Cookbook:: rio_kibana
# Recipe:: firewall
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'firewalld'

service 'firewalld' do
	action [:enable, :start]
end

firewalld_service 'ssh' do
	action :add
end

firewalld_port '5601/tcp' do
	action :add
end