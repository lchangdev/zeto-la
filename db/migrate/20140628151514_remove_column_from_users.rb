class RemoveColumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :address_present
  end

  def down
    add_column :users, :address_present, :boolean, default: false
  end
end
