class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :yt_id

      t.timestamps
    end
  end
end
