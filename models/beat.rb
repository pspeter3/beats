class Beat
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::FullTextSearch
  include Mongo::Voteable
  include Mongoid::Timestamps
  
  field :uid, :type => Integer
  field :crime, :type => String
  field :timestamp, :type => Time
  field :location, :type => String
  field :summary, :type => String
  field :disposition, :type => String
  field :value, :type => Integer
  
  key :uid
  
  validates_presence_of :uid
  validates_presence_of :crime
  validates_presence_of :timestamp
  validates_presence_of :location
  validates_presence_of :summary
  validates_presence_of :disposition
  
  embeds_many :comments
  
  fulltext_search_in :summary
  voteable self, :up => +1, :down => -1
  
  before_create :add_crime_to_tags
  
  # Hand made pagination
  def self.paginate(page)
    self.skip((page - 1) * 10).limit(10)
  end
  
  private
  def add_crime_to_tags
    self.tags = self.crime
  end
end
