class Playlist < ActiveRecord::Base
  has_one :user
  has_many :contributors, :class_name => "PlaylistContributor"
  has_many :users, :through => :playlist_contributors
  has_many :clips
end
