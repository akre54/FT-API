class MakeTransactionBelongToTab < ActiveRecord::Migration
  def up
    add_column :transactions, :tab_id, :integer

    Transaction.all.each do |t|
        debugger
        t.tab = Tab.find_by_customer_id_and_farm_id(t.customer_id, t.farm_id)
    end

    # need to set the data before adding a null constraint so db doesnt complain
    change_column :transactions, :tab_id, :integer, null: false

    remove_column :transactions, :customer_id
    remove_column :transactions, :farm_id

    Transaction.reset_column_information
  end

  def down
    add_column :transactions, :customer_id, :integer
    add_column :transactions, :farm_id, :integer

    Transaction.all.each do |t|
        t.customer_id = t.tab.customer_id
        t.farm_id = t.tab.farm_id
    end

    change_column :transactions, :customer_id, :integer, null: false
    change_column :transactions, :farm_id, :integer, null: false

    remove_column :transactions, :tab_id
    
    Transaction.reset_column_information
  end
end
