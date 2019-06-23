#
# Cookbook:: rio_elasticsearch
# Recipe:: install
#
# Copyright:: 2019, The Authors, All Rights Reserved.

yum_repository 'elasticsearch-7.x' do
    description 'Elasticsearch repository for 7.x packages'
    baseurl 'https://artifacts.elastic.co/packages/7.x/yum'
    gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    action :create
end

yum_package 'java-1.8.0-openjdk' do
    action :install
end

yum_package 'elasticsearch' do
    action :install
end

service 'elasticsearch.service' do
    action :enable
end