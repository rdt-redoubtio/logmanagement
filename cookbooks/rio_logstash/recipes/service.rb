#
# Cookbook:: rio_logstash
# Recipe:: service
#
# Copyright:: 2019, The Authors, All Rights Reserved.

service 'logstash.service' do
    action [:enable, :start]
end