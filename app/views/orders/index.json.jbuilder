json.array!(@orders) do |order|
  json.extract! order, :id, :total_price, :num_units, :employee_id
  json.url order_url(order, format: :json)
end
