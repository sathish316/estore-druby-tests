class Order < ActiveRecord::Base
  attr_accessible :user_id, :status
  has_many :order_items
  belongs_to :user

  def fulfill
    order_items.each do |order_item|
      InventoryItem.fulfill(order_item.product_id, order_item.quantity, self.user.shipping_address || "PO-BOX-123")
    end
    self.update_attributes!(status: 'fulfilled')
  end
end
