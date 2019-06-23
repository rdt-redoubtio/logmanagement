# InSpec test for recipe rio_logstash::config

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


describe directory('/etc/logstash/conf.d') do
    it { should exist }
    its('mode') { should cmp '0775' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end
  
describe file('/etc/logstash/conf.d/Default-Filter.conf') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end

describe file('/etc/logstash/conf.d/Default-Inputs.conf') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end

describe file('/etc/logstash/conf.d/Default-Outputs.conf') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end

describe file('/etc/systemd/system/logstash.service') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end