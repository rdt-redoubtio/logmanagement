#
# Cookbook:: rio_kibana
# Recipe:: service
#
# Copyright:: 2019, The Authors, All Rights Reserved.

service 'kibana.service' do
    action [:enable, :start]
end