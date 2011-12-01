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
  
  index :timestamp
  index :uid, :unique => true
  index 'votes.point'
  
  embeds_many :comments
  
  fulltext_search_in :summary
  voteable self, :up => +1, :down => -1
    
  # Hand made pagination
  def self.paginate(page)
    result_size = 20
    skip_count = (page - 1) * result_size
    self.skip(skip_count).limit(result_size)
  end
end
