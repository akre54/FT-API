object @customer
attributes :id, :name, :email
node(:balance) { |customer| customer.balance }
