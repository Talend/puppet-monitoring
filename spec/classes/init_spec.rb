require 'spec_helper'

describe 'monitoring' do
  let(:facts) {{ :osfamily => 'RedHat'}}
  context 'with default values for all parameters' do
    it {should compile}
  end
end