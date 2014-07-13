class SetDefaultAddressForUsers < ActiveRecord::Migration
  def change
    change_column :users, :address, :string, default: '33 Harrison Ave. #501, Boston MA. 02111'
    change_column :users, :latitude, :float, default: 42.3516303
    change_column :users, :longitude, :float, default: -71.0614178
  end
end
