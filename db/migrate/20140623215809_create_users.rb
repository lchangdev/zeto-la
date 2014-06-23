class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :image, null: false
      t.string :email, null: false
      t.string :location
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at, null: false
      t.integer :launcher_id

      t.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
