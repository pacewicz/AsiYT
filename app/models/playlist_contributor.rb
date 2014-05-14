class PlaylistContributor < ActiveRecord::Base
  has_one :user
  has_one :playlist
end
