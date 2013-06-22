class InventoryItem
  BASE_URL = "http://localhost:4003"

  def self.fulfill(product_id, quantity, shipping_address)
    url = "#{BASE_URL}/inventory_items/fulfill.json"
    response = RestClient.post url, {product_id: product_id, quantity: quantity, shipping_address: shipping_address}
  end
end
