# InSpec test for recipe rio_kibana::service

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe service('kibana.service') do
    it { should be_running }
    it { should be_enabled }
end