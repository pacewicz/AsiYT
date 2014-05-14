class User < ActiveRecord::Base
  has_many :playlist_contributors, as: "contributor_connections"
  has_many :playlists
end
