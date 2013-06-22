class DeliveryItem
  BASE_URL = "http://localhost:4005/delivery_items.json"

  def self.dispatch(product_id, quantity, shipping_address)
    url = BASE_URL
    response = RestClient.post url, {delivery_item: {product_id: product_id, quantity: quantity, shipping_address: shipping_address}}
  end
end
