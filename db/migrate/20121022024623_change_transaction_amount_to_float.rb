class ChangeTransactionAmountToFloat < ActiveRecord::Migration
  def up
    change_column :transactions, :amount, :decimal, precision: 10, scale: 2, null: false
  end

  def down
    change_column :transactions, :amount, :string, null: false
  end
end
