class ChangePostDateToString < ActiveRecord::Migration
  def change
    change_column :posts, :date, :string, null: false
  end
end
