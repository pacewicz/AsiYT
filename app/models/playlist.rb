# class Playlist < ActiveRecord::Base
#   has_one :user, :inverse_of => :playlists, :autosave => true
#   has_many :contributors, :class_name => "PlaylistContributor", :inverse_of => :playlists, :autosave => true
#   has_many :users, :inverse_of => :playlists, :through => :playlist_contributors, :autosave => true
#   has_many :clips, :inverse_of => :playlists, :autosave => true
# end
#

class Playlist < ActiveRecord::Base
  has_one :user
  has_many :contributors, :class_name => "PlaylistContributor"
  has_many :users, :through => :playlist_contributors
  has_many :clips
end
