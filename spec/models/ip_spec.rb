require 'spec_helper'

describe Ip do
  let(:ip) { Ip.new }
  it 'can be created' do
    ip.should_not be_nil
  end
  it { should have_field(:addr).of_type(String) }
  it { should validate_presence_of(:addr) }
  it { should validate_uniqueness_of(:addr) }
end
