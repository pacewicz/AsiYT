class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :clip
      t.integer :value

      t.timestamps
    end
  end
end
