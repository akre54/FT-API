class ChangeTransactionAmountToFloat < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table transactions
      alter column amount
      type decimal(10,2) using cast(amount as decimal)
    })
  end

  def down
    change_column :transactions, :amount, :string, null: false
  end
end
