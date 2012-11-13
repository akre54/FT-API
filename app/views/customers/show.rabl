object @customer
attributes :id, :name, :email, :img_url
node(:balance) { |customer|
  tab = customer.tabs.find_by_farm_id @current_farm.id
  tab.balance
}

# not sure bout this one... # node(:balanceStr) { |customer| number_to_currency(customer.balance, unit: "$") }
