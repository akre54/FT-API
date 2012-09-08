object @current_farm
attributes :id, :farm_name, :email
child (@customers => :customers) do
  extends "customers/show"
end
