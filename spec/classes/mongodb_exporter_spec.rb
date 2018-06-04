require 'spec_helper'

describe 'monitoring::mongodb_exporter' do
  let(:facts) {{ :osfamily => 'RedHat'}}
  let(:params) {{ :version => '0.3.1'}}
  context 'with default values for all parameters' do
    it {
      should compile
      is_expected.to contain_user('mongodb_exporter')
      is_expected.to contain_file('/usr/lib/systemd/system/mongodb_exporter.service')
      is_expected.to contain_file('/etc/sysconfig/mongodb_exporter')
      is_expected.to contain_wget__fetch('/tmp/mongodb_exporter-0.3.1.linux-amd64.tar.gz')
      is_expected.to contain_service('mongodb_exporter.service')
    }
  end
end