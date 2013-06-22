class Cart < ActiveRecord::Base
  attr_accessible :user_id
  has_many :cart_items
  belongs_to :user

  def add_item(product_id)
    cart_item = self.cart_items.find_or_create_by_product_id(product_id)
    quantity = (cart_item.quantity || 0) + 1
    cart_item.update_attributes!(quantity: quantity)
  end

  def create_order
    products_by_id = Product.all.index_by {|p| p['id']}
    order = Order.create!(user_id: user_id, status: 'created')
    cart_items.each do |cart_item|
      price = products_by_id[cart_item.product_id]['price']
      order.order_items.create!(product_id: cart_item.product_id, quantity: cart_item.quantity, price: price, status: 'created')
      cart_item.destroy
    end
    order
  end
end
