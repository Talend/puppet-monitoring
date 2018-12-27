require 'spec_helper'

describe 'jmx_exporter' do
  
  describe user('jmx_exporter') do
    it { should exist }
  end

  describe file('/opt/jmx_exporter-0.3.1/jmx_prometheus_javaagent-0.3.1.jar') do
    it { should be_file }
  end

  describe file('/opt/jmx_exporter-0.3.1/kafka.yaml') do
    it { should be_file }
    its(:content) { should include 'kafka' }
  end

end
