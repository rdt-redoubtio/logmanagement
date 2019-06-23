# InSpec test for recipe rio_kibana::config

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe file('/etc/kibana/kibana.yml') do
    it { should exist }
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
end

describe http('http://192.168.0.18:5601') do
    its('status') { should cmp 302 }
end

describe http('http://192.168.0.18:5601/app/kibana#/home?_g=()') do
    its('status') { should cmp 200 }
end