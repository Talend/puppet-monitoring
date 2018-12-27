require 'spec_helper'

describe 'monitoring::jmx_exporter' do
  let(:params) {{ :jmx_exporter_service => 'kafka'}}
  context 'with default values for most parameters' do
    it {
      should compile
      is_expected.to contain_user('jmx_exporter')
      is_expected.to contain_file('/opt/jmx_exporter-0.3.1/jmx_prometheus_javaagent-0.3.1.jar')
      is_expected.to contain_file('/opt/jmx_exporter-0.3.1/kafka.yaml')
    }
  end
end
