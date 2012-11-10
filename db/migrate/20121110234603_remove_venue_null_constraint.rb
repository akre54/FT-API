class RemoveVenueNullConstraint < ActiveRecord::Migration
  def up
    change_column :venues, :schedule, :string, :null => true
    change_column :venues, :lat, :float, :null => true
    change_column :venues, :long, :float, :null => true
    change_column :venues, :social, :string, :null => true
    change_column :transactions, :venue_id, :integer, :null => true
  end

  def down
    change_column :venues, :schedule, :string, :null => false
    change_column :venues, :lat, :float, :null => false
    change_column :venues, :long, :float, :null => false
    change_column :venues, :social, :string, :null => false
    change_column :transactions, :venue_id, :integer, :null => false
  end
end
