class AddIndeciesToTabs < ActiveRecord::Migration
  def change
    add_index :tabs, :farm_id
    add_index :tabs, :customer_id
    add_index :transactions, :tab_id
  end
end
