# InSpec test for recipe rio_kibana::install

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe yum.repo('kibana-7.x') do
    it { should exist }
    it { should be_enabled }
end

describe package('kibana') do
	it { should be_installed }
end

describe service('kibana.service') do
    it { should be_installed }
end

describe file('/etc/systemd/system/kibana.service') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end