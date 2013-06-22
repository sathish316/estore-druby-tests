class DeliveryItem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :shipping_address
end
