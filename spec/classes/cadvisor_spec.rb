require 'spec_helper'

describe 'monitoring::cadvisor' do
  let(:pre_condition) { 'user {docker:}' }
  let(:facts) {{ :osfamily => 'RedHat'}}
  let(:params) {{ :version => '0.29.0'}}
  context 'with default values for all parameters' do
    it {
      should compile
      is_expected.to contain_user('cadvisor')
      is_expected.to contain_file('/usr/lib/systemd/system/cadvisor.service')
      is_expected.to contain_file('/etc/sysconfig/cadvisor')
      is_expected.to contain_file('/opt/cadvisor-0.29.0.linux-amd64')
      is_expected.to contain_service('cadvisor.service')
    }
  end
end