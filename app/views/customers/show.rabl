object @customer
attributes :id, :name, :email
node(:balance) { |customer| number_to_currency(customer.balance, unit: "$") }
