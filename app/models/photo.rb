class Photo < ActiveRecord::Base
  attr_accessible :hashie
  belongs_to :search
end