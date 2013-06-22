class PurchaseOrder < ActiveRecord::Base
  attr_accessible :expected_date, :supplier, :status
  has_many :purchase_order_items

  def receive
    purchase_order_items.each do |item|
      item.receive
    end
    self.update_attributes!(status: 'received')
  end
end
