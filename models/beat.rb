class Beat
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::FullTextSearch
  include Mongo::Voteable
  include Mongoid::Timestamps
  
  field :id, :type => Integer
  field :crime, :type => String
  field :timestamp, :type => Time
  field :location, :type => String
  field :summary, :type => String
  field :disposition, :type => String
  field :value, :type => Integer
  
  key :id
  
  validates_presence_of :id
  validates_presence_of :crime
  validates_presence_of :timestamp
  validates_presence_of :location
  validates_presence_of :summary
  validates_presence_of :disposition
  
  embeds_many :comments
  
  fulltext_search_in :summary
  voteable self, :up => +1, :down => -1
  
  before_create :add_crime_to_tags
  
  private
  def add_crime_to_tags
    self.tags = self.crime
  end
end
