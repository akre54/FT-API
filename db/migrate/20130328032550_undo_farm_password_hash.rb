class UndoFarmPasswordHash < ActiveRecord::Migration
  def change
    remove_column :farms, :password_salt
    remove_column :farms, :password_hash
  end
end
