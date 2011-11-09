require 'spec_helper'

describe "Ip Model" do
  let(:ip) { Ip.new }
  it 'can be created' do
    ip.should_not be_nil
  end
end
