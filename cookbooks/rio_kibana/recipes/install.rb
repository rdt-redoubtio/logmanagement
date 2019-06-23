#
# Cookbook:: rio_kibana
# Recipe:: install
#
# Copyright:: 2019, The Authors, All Rights Reserved.


yum_repository 'kibana-7.x' do
    description 'Kibana repository for 7.x packages'
    baseurl 'https://artifacts.elastic.co/packages/7.x/yum'
    gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    action :create
end

yum_package 'kibana' do
    action :install
end

service 'kibana.service' do
    action :enable
end