# # encoding: utf-8

# Inspec test for recipe rio_elasticsearch::config

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/elasticsearch/elasticsearch.yml') do
    it { should exist }
    its('mode') { should cmp '0660' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'elasticsearch' }
end

describe directory('/var/elasticsearch') do
    it { should exist }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'elasticsearch' }
    its('group') { should eq 'elasticsearch' }
end
  
describe directory('/etc/systemd/system/elasticsearch.service.d/') do
    it { should exist }
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end
  
describe file('/etc/systemd/system/elasticsearch.service.d/override.conf') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end