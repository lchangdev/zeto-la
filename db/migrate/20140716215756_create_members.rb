class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
    end
    add_index :members, [:post_id, :user_id], unique: true
  end
end
