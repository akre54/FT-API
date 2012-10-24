class RenameUserIdToCustomerId < ActiveRecord::Migration
  def change
    rename_column :transactions, :user_id, :customer_id
  end
end
