object @customer
attributes :id, :name, :email, :img_url, :balance
# not sure bout this one... # node(:balanceStr) { |customer| number_to_currency(customer.balance, unit: "$") }
