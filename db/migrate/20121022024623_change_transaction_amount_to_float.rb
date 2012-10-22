class ChangeTransactionAmountToFloat < ActiveRecord::Migration
  def up
    change_column :transactions, :amount, :float, :null => false
  end

  def down
    change_column :transactions, :amount, :string, :null => false
  end
end
