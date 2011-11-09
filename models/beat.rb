class Beat
  include Mongoid::Document
  include Mongoid::Tagable
  include Mongoid::FullTextSearch
  include Mongo::Voteable
  
  field :type, :type => String
  field :timestamp, :type => Time
  field :location, :type => String
  field :summary, :type => String
  
  validates_presence_of :type
  validates_presence_of :timestamp
  validates_presence_of :location
  validates_presence_of :summary
  
  embeds_many :comments
  
  fulltext_search_in :summary
  voteable self, :up => +1, :down => -1
end
