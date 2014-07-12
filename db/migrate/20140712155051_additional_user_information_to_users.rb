class AdditionalUserInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tagline, :string, limit: 160
    add_column :users, :twitter, :string
    add_column :users, :github, :string
  end
end
