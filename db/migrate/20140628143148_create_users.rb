class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :image, null: false
      t.string :email, null: false
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :cohort
      t.string :company_name
      t.boolean :address_present, default: false

      t.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
