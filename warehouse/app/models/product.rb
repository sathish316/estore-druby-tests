class Product
  BASE_URL = "http://127.0.0.1:4002/products.json"

  def self.all(category_id=nil)
    url = BASE_URL
    url += "?category_id=#{category_id}" if category_id
    JSON.parse(RestClient.get(url))
  end
end
