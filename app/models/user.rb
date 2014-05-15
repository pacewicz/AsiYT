class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :playlist_contributors, as: "contributor_connections"
  has_many :playlists
  has_many :clips
  has_many :ratings
end
