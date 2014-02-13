class Employee < ActiveRecord::Base
  has_many :orders

  # Uses the total price without calculating in the units
  # divided by the number of orders.
  def average_total_price
    summed_price_of_orders(orders) / orders.size unless orders.empty?
  end

  # Calculates average unit price for all orders in last 30 days
  def average_unit_price
    orders_in_last_30_days = orders.in_last_days(30)
    summed_price_of_orders(orders_in_last_30_days) / summed_units_of_orders(orders_in_last_30_days) unless orders.empty?
  end

  def summed_price_of_orders(selected_orders)
    selected_orders.reduce(0.0) { |acc, order| acc + order.total_price }
  end

  def summed_units_of_orders(selected_orders)
    selected_orders.reduce(0) { |acc, order| acc + order.num_units }
  end

  def to_s
    name
  end
end
