#
# Cookbook:: rio_elasticsearch
# Recipe:: maintenance
#
# Copyright:: 2019, The Authors, All Rights Reserved.

yum_repository 'curator-5' do
    description 'CentOS/RHEL 7 repository for Elasticsearch Curator 5.x packages'
    baseurl 'https://packages.elastic.co/curator/5/centos/7'
    gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    action :create
end

yum_package 'elasticsearch-curator' do
    action :install
end

yum_package 'crontabs.noarch' do
    action :install
end

service 'crond.service' do
    action [:enable, :start]
end

template '/etc/cron.daily/es-maintenance.sh' do
    source 'es-maintenance.sh.erb'
    owner 'root'
    group 'root'
    mode '755'
    action :create
end

directory '/etc/curator/' do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end

template '/etc/curator/curator.yml' do
    source 'curator.yml.erb'
    owner 'root'
	group 'root'
    mode '0644'
    variables(
        fqdn: node['fqdn'],
    )
    action :create
end

template '/etc/curator/action.yml' do
    source 'action.yml.erb'
    owner 'root'
	group 'root'
    mode '0644'
    variables(
        indexmaxage: node['rio_elasticsearch']['indexmaxage'],
    )
    action :create
end
