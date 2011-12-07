class Crime
  include Mongoid::Document

  field :value, :type => Hash
end
