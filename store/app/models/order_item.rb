class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity, :status
  belongs_to :order
end
