class Playlist < ActiveRecord::Base
  has_one :creator, :class_name => "User"
  has_many :contributors, :class_name => "PlaylistContributor"
  has_many :clips
end
