class SetDefaultBalanceTo0 < ActiveRecord::Migration
  def change
    change_column_default :tabs, :balance, 0.00
  end
end
