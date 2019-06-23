#
# Cookbook:: rio_logstash
# Recipe:: install
#
# Copyright:: 2019, The Authors, All Rights Reserved.

yum_repository 'logstash-7.x' do
    description 'Elastic repository for 7.x packages'
    baseurl 'https://artifacts.elastic.co/packages/7.x/yum'
    gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    action :create
end

yum_package 'java-1.8.0-openjdk' do
    action :install
end

yum_package 'logstash' do
    action :install
end

template '/etc/systemd/system/logstash.service' do
    source 'logstash.service.erb'
    sensitive true
    action :create
    notifies :run, 'execute[systemctl-daemon-reload]', :immediate
end

execute 'systemctl-daemon-reload' do
    command 'systemctl daemon-reload'
    action :nothing
end

service 'logstash.service' do
    action :enable
end