class Search < ActiveRecord::Base
  attr_accessible :input, :latitude, :longitude
  has_many :photos
end

# dolores park = 37.76058,-122.426716