class DropCustomersFarmsXTable < ActiveRecord::Migration
  def up
    drop_table :customers_farms
  end

  def down
    create_table "customers_farms", :id => false, :force => true do |t|
      t.integer "customer_id", :null => false
      t.integer "farm_id",     :null => false
    end
  end
end
