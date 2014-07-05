class AddColumnConfirmationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation, :boolean, default: false
  end
end
