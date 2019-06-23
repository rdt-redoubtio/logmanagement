#
# Cookbook:: rio_elasticsearch
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

firewalld_port '9200/tcp' do
	action :add
end

firewalld_port '9300/tcp' do
	action :add
end