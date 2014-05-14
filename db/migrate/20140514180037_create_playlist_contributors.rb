class CreatePlaylistContributors < ActiveRecord::Migration
  def change
    create_table :playlist_contributors do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.integer :role

      t.timestamps
    end
  end
end
