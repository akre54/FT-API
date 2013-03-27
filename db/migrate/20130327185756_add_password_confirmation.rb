class AddPasswordConfirmation < ActiveRecord::Migration
  def change
    add_column :farms, :password_confirmation, :string
  end
end
