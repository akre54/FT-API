class UndoPasswordHash < ActiveRecord::Migration
  def change
    remove_column :customers, :password_salt
    remove_column :customers, :password_hash
  end
end
