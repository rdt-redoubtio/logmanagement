# InSpec test for recipe rio_logstash::install

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe yum.repo('logstash-7.x') do
    it { should exist }
    it { should be_enabled }
end

describe package('java-1.8.0-openjdk') do
	it { should be_installed }
end

describe package('logstash') do
	it { should be_installed }
end

describe service('logstash.service') do
    it { should be_installed }
end

describe file('/etc/systemd/system/logstash.service') do
    it { should exist }
end