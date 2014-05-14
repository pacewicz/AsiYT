class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
  end
end