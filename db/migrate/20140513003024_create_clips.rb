class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :yt_id
      t.belongs_to :playlist
      t.belongs_to :user
      t.string :title
      t.string :thumbnail
      t.string :description


      t.timestamps
    end
  end
end
