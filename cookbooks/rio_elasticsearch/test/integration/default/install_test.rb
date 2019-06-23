# # encoding: utf-8

# Inspec test for recipe rio_elasticsearch::install

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe yum.repo('elasticsearch-7.x') do
    it { should exist }
    it { should be_enabled }
end

describe package('java-1.8.0-openjdk') do
	it { should be_installed }
end

describe package('elasticsearch') do
	it { should be_installed }
end

describe service('elasticsearch.service') do
    it { should be_installed }
end