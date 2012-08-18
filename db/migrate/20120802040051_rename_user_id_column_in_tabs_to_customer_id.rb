class RenameUserIdColumnInTabsToCustomerId < ActiveRecord::Migration
  def change
    rename_column :tabs, :user_id, :customer_id
  end
end
