class AddSecurePassword < ActiveRecord::Migration
  def change
    rename_column :customers, :salt, :password_salt
    rename_column :customers, :crypted_pin, :password_hash
    add_column :customers, :password_digest, :string

    rename_column :farms, :salt, :password_salt
    rename_column :farms, :pass, :password_hash
    add_column :farms, :password_digest, :string
  end
end
