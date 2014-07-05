class AddColumnsToContactRequests < ActiveRecord::Migration
  def change
    add_column :contact_requests, :title, :string
    add_column :contact_requests, :description, :text
  end
end
