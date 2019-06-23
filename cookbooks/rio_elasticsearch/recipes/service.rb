#
# Cookbook:: rio_elasticsearch
# Recipe:: service
#
# Copyright:: 2019, The Authors, All Rights Reserved.


service 'elasticsearch.service' do
    action [:enable, :start]
end