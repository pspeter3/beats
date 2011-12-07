require 'spec_helper'

describe Crime do
  let(:crime) { Crime.new }
  it 'can be created' do
    crime.should_not be_nil
  end
  it { should have_field(:value).of_type(Hash) }
end
