class RemoveNullConstraintsFromVenue < ActiveRecord::Migration
  def up
    change_column :transaction, :amount, :float, :null => false
  end

  def down
    change_column :transaction, :amount, :string, :null => false
  end
end
