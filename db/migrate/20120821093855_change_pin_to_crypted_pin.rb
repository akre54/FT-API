class ChangePinToCryptedPin < ActiveRecord::Migration
  def change
    rename_column :customers, :pin, :crypted_pin
  end
end
