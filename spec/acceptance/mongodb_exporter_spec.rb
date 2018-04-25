require 'spec_helper'

describe 'mongodb_exporter' do
  
  describe user('mongodb_exporter') do
    it { should exist }
  end

  describe service('mongodb_exporter.service') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('/usr/bin/curl -v http://127.0.0.1:9216/metrics') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should include 'mongodb_exporter_last_scrape_duration_seconds' }
  end
end