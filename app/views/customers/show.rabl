object @customer
attributes :id, :name, :email, :img_url
node(:balance) { |customer| number_to_currency(customer.balance, unit: "$") }
