class RemoveNullConstraintsFromVenue < ActiveRecord::Migration
  def up
    change_column :venues, :schedule, :string
    change_column :venues, :lat, :float
    change_column :venues, :long, :float
    change_column :venues, :social, :string
  end

  def down
    change_column :venues, :schedule, :string, :null => false
    change_column :venues, :lat, :float, :null => false
    change_column :venues, :long, :float, :null => false
    change_column :venues, :social, :string, :null => false
  end
end
