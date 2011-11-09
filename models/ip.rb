class Ip
  include Mongoid::Document
  include Mongo::Voter

  field :addr, :type => String
  
  validates_presence_of :addr
  validates_uniqueness_of :addr
  
  index :addr, :unique => true
end
