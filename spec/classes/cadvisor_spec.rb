require 'spec_helper'

describe 'monitoring::cadvisor' do
  let(:pre_condition) { 'user {docker:}' }
  let(:facts) {{ :osfamily => 'RedHat'}}
  context 'with default values for all parameters' do
    it {should compile}
  end
end

