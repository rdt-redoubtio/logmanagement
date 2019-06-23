# InSpec test for recipe rio_kibana::firewall

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

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

describe port(5601) do
	it { should be_listening }
	its('protocols') { should include('tcp') }
	its('protocols') { should_not include('udp') }
	its('processes') { should include 'node'}
end