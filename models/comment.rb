class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :body, :type => String
  field :approved, :type => Boolean, :default => false
  
  validates_presence_of :body
  validates_length_of :body, :minimum => 1, :maximum => 140
  
  embedded_in :beat
end
