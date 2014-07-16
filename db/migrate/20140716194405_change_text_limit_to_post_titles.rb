class ChangeTextLimitToPostTitles < ActiveRecord::Migration
  def change
    change_column :posts, :title, :string, limit: 60
  end
end
