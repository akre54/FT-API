class AllowReceiptToBeNull < ActiveRecord::Migration
  def up
    change_column :transactions, :receipt_dump, :string, :null => true
  end

  def down
    change_column :transactions, :receipt_dump, :string, :null => false
  end
end
