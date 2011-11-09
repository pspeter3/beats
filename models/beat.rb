class Beat
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::FullTextSearch
  include Mongo::Voteable
  include Mongoid::Timestamps
  
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
  
  before_create :add_type_to_tags
  
  private
  def add_type_to_tags
    self.tags = self.type
  end
end
