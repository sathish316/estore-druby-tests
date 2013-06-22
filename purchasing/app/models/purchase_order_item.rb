class PurchaseOrderItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :purchase_order_id, :quantity
  belongs_to :purchase_order

  def receive
    InventoryItem.add_stock(product_id, quantity)
  end
end
