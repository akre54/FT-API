object @customer
attributes :id, :name, :email, :img_url
node(:balance) { |customer|
  customer.balance @current_farm
}

# not sure bout this one... # node(:balanceStr) { |customer| number_to_currency(customer.balance, unit: "$") }
