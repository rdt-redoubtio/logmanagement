# # encoding: utf-8

# Inspec test for recipe rio_elasticsearch::service

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service('elasticsearch.service') do
    it { should be_running }
    it { should be_enabled }
end

describe json(content: http('http://192.168.0.16:9200/_cluster/health').body) do
    its('cluster_name') { should eq 'testcluster' }
    its('status') { should eq 'green' }
    its('number_of_nodes') { should eq 2 }
end