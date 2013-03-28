class DropFarmPrefix < ActiveRecord::Migration
  def change
    rename_column :farms, :farm_name, :name
    rename_column :farms, :farm_address, :address
  end
end
