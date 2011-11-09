require 'spec_helper'

describe "Beat Model" do
  let(:beat) { Beat.new }
  it 'can be created' do
    beat.should_not be_nil
  end
end
