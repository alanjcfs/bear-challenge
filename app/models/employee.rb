class Employee < ActiveRecord::Base
  has_many :orders

  def average_total_price
    orders.reduce(0.0) { |acc, order| acc + order.total_price } /
      orders.reduce(0) { |acc, order| acc + order.num_units } unless orders.empty?
  end
end
