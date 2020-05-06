require 'spec_helper'

describe 'monitoring::cadvisor' do
  let(:pre_condition) { 'user {docker:}' }
  let(:facts) {{ :osfamily => 'RedHat'}}
  let(:params) do
    {
      :version => '0.29.0',
      :version_checksum => 'f5c8deb31eb12cae38007f0f4a208e0b9ba2b2ad6a1c9610b32d113221880d4e',
    }
  end
  context 'with default values for all parameters' do
    it 'should compile'
    is_expected.to contain_file('/usr/lib/systemd/system/cadvisor.service')
    is_expected.to contain_file('/etc/sysconfig/cadvisor')
    is_expected.to contain_file('/opt/cadvisor-0.29.0.linux-amd64')
    is_expected.to contain_service('cadvisor.service')
  end
end