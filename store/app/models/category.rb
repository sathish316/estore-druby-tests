# require 'restclient'

class Category
  BASE_URL = "http://127.0.0.1:4002/categories.json"

  def self.all
    JSON.parse(RestClient.get(BASE_URL))
  end
end
