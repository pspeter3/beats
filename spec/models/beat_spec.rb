require 'spec_helper'

describe Beat do
  let(:beat) { Beat.new }
  it 'can be created' do
    beat.should_not be_nil
  end
  it { should have_fields(:type, :location, :summary).of_type(String) }
  it { should have_field(:timestamp).of_type(Time) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:timestamp) }
  it { should embed_many(:comments) }
  
  it 'should add the type as a tag' do
    b = Beat.create(:type => 'Hacking', :location => 'Lopata', 
      :summary => 'Student wrote API server', :timestamp => Time.now)
    b.tags_array.should include('Hacking')
  end
end
