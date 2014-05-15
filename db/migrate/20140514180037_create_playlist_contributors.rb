class CreatePlaylistContributors < ActiveRecord::Migration
  def change
    create_table :playlist_contributors do |t|
      t.belongs_to :user
      t.belongs_to :playlist
      t.integer :role

      t.timestamps
    end
  end
end
