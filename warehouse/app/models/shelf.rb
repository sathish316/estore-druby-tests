class Shelf < ActiveRecord::Base
  attr_accessible :level, :x, :y

  def self.next_available
    Shelf.find_or_create_by_x_and_y_and_level(rand(100), rand(100), rand(10))
  end
end
