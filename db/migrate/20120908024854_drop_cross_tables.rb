class DropCrossTables < ActiveRecord::Migration
  def up 
    drop_table :customer_x_tab
    drop_table :customer_x_transaction
    drop_table :farm_x_customer
    drop_table :farm_x_inventory
    drop_table :farm_x_transaction
    drop_table :farm_x_venue
    drop_table :inventory_x_items
    drop_table :inventory_x_venue
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
