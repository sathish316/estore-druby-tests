class InventoryItem < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :shelf_id
  belongs_to :shelf

  def fulfill_and_dispatch(quantity, shipping_address)
    self.quantity -= Integer(quantity)
    self.save!
    self.destroy if self.quantity == 0
    DeliveryItem.dispatch(product_id, Integer(quantity), shipping_address)
  end
end
