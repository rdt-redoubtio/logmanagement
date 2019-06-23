# # encoding: utf-8

# Inspec test for recipe rio_elasticsearch::maintenance

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe yum.repo('curator-5') do
    it { should exist }
    it { should be_enabled }
  end
  
describe package('elasticsearch-curator') do
    it { should be_installed }
end

describe package('crontabs.noarch') do
    it { should be_installed }
end

describe service('elasticsearch.service') do
    it { should be_installed }
    it { should be_running }
    it { should be_enabled }
end

describe file('/etc/cron.daily/es-maintenance.sh') do
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should exist }
end

describe directory('/etc/curator') do
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should exist }
end

describe file('/etc/cron.daily/es-maintenance.sh') do
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should exist }
end

describe file('/etc/curator/curator.yml') do
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should exist }
end

describe file('/etc/curator/action.yml') do
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should exist }
end