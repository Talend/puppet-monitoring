require 'spec_helper'

describe 'monitoring::cadvisor' do
  let(:facts) {{ :osfamily => 'RedHat'}}
  context 'with default values for all parameters' do
    it {
      should compile
      is_expected.to contain_user('cadvisor')
      is_expected.to contain_file('/usr/lib/systemd/system/cadvisor.service')
      is_expected.to contain_file('/etc/sysconfig/cadvisor')
      is_expected.to contain_service('cadvisor.service')
    }
  end
end