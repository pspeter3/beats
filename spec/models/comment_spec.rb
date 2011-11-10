require 'spec_helper'

describe Comment do
  let(:comment) { Comment.new }
  it 'can be created' do
    comment.should_not be_nil
  end
  it { should have_field(:name).of_type(String) }
  it { should have_field(:body).of_type(String) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).within(1..16) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).within(1..140) }
  it { should have_field(:approved).of_type(Boolean).with_default_value_of(false) }
  it { should be_embedded_in(:beat) }
end
