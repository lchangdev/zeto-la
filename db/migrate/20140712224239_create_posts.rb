class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :date, null: false
      t.time :time
      t.integer :user_id, null: false
      t.string :role
      t.timestamps
    end
  end
end
