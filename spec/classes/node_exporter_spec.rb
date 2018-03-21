require 'spec_helper'

describe 'monitoring::node_exporter' do
  let(:facts) {{ :osfamily => 'RedHat'}}
  context 'with default values for all parameters' do
    it {
      should compile
      is_expected.to contain_user('node_exporter')
      is_expected.to contain_file('/opt/node_exporter-0.15.2.linux-amd64')
      is_expected.to contain_file('/usr/lib/systemd/system/node_exporter.service')
      is_expected.to contain_file('/etc/sysconfig/node_exporter')
      is_expected.to contain_archive('/tmp/node_exporter-0.15.2.tar.gz')
      is_expected.to contain_service('node_exporter.service')
    }
  end
end