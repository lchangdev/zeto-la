class CreateLaunchers < ActiveRecord::Migration
  def change
    create_table :launchers do |t|
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :cohort
      t.string :company_name
      t.integer :user_id
      t.timestamps
    end
  end
end
