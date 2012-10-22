class RemoveNullConstraintsFromVenue < ActiveRecord::Migration
  def up
    change_column :venue, :schedule, :string, :null => true
    change_column :venue, :lat, :float, :null => true
    change_column :venue, :long, :float, :null => true
    change_column :venue, :social, :string, :null => true
  end

  def down
    change_column :venue, :lat, :float, :null => false
    change_column :venue, :long, :float, :null => false
    change_column :venue, :social, :string, :null => false
  end
end
