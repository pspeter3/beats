class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :body, :type => String
  
  validates_presence_of :body
  validates_length_of :body, :minimum => 1, :maximum => 140
end
