class UpdateColumnOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :address, :string, null: false
  end
end
