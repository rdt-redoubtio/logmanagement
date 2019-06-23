#
# Cookbook:: rio_logstash
# Spec:: firewall
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'rio_logstash::firewall' do
  context 'When all attributes are default, on CentOS 7.6.1804' do
    let(:chef_run) { runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.6.1804').converge(described_recipe) }
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
