class AddSecondaryEmailColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secondary_email, :string
  end
end
