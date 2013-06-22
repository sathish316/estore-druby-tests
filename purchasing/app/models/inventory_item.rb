class InventoryItem
  BASE_URL = "http://localhost:4003/inventory_items.json"

  def self.add_stock(product_id, quantity)
    url = BASE_URL
    response = RestClient.post url, {inventory_item: {product_id: product_id, quantity: quantity}}
  end
end
