require 'spec_helper'

describe Beat do
  let(:beat) { Beat.new }
  it 'can be created' do
    beat.should_not be_nil
  end
  it { should have_fields(:uid, :value).of_type(Integer) }
  it { should have_fields(:crime, :location, :summary, :disposition).of_type(String) }
  it { should have_field(:timestamp).of_type(Time) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:crime) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:timestamp) }
  it { should validate_presence_of(:disposition) }
end
