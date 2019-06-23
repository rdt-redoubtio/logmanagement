# # encoding: utf-8

# Inspec test for recipe rio_elasticsearch::firewall

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe systemd_service('firewalld') do
	it { should be_installed }
	it { should be_enabled }
	it { should be_running }
end

describe port(22) do
	it { should be_listening }
	its('protocols') { should include('tcp') }
	its('protocols') { should_not include('udp') }
end

describe port(9200) do
	it { should be_listening }
	its('protocols') { should include('tcp') }
	its('protocols') { should_not include('udp') }
	its('processes') { should include 'java'}
end

describe port(9300) do
	it { should be_listening }
	its('protocols') { should include('tcp') }
	its('protocols') { should_not include('udp') }
	its('processes') { should include 'java'}
end
