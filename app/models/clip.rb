class Clip < ActiveRecord::Base
  belongs_to :playlist
  has_many :ratings
end
