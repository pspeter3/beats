class Beat
  include Mongoid::Document
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
  validates_uniqueness_of :uid
  validates_presence_of :crime
  validates_presence_of :timestamp
  validates_presence_of :location
  validates_presence_of :summary
  validates_presence_of :disposition
  
  index 'votes.point'
  index :uid
    
  embeds_many :comments
  
  fulltext_search_in :summary
  voteable self, :up => +1, :down => -1
    
  # Hand made pagination
  def self.paginate(page)
    result_size = 20
    skip_count = (page - 1) * result_size
    self.skip(skip_count).limit(result_size)
  end
  
  # Calculate crimes and locations
  def self.calculate(uid)
    # Define the map function in javascript
    map = <<EOF
function() {
  var result = {count: 1, locations: {}};
  result.locations[this.location] = 1;
  
  emit(this.crime, result);
}
EOF

# Define the reduce function in javascript
    reduce = <<EOF
function(key, values) {
  var result = {count: 0, locations: {}};

  for(var i = 0; i < values.length; i++) {
    var value = values[i];
    result.count += value.count;
    for (var loc in value.locations) {
      if (result.locations[loc] !== undefined) {
        result.locations[loc] += value.locations[loc];
      } else {
        result.locations[loc] = value.locations[loc];
      }
    }
  }

  return result;
}
EOF

    self.collection.map_reduce(map, reduce, {
      'out' => {'reduce' => 'crimes'},
      'query' => {'uid' => {'$gt' => uid}}
    })
  end
end
