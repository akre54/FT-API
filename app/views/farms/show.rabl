object @current_farm
attributes :id, :name, :email
child :customers do
  extends "customers/show"
end
