class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image_url, :price, :title
  belongs_to :category
end
