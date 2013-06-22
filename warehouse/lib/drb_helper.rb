require 'drb/drb'

class Shelf < ActiveRecord::Base
  include DRbUndumped
end

class InventoryItem < ActiveRecord::Base
  include DRbUndumped
end

class DRbHelper
  def create(model_name, params)
    object = FactoryGirl.create(model_name, params)
  end

  def find(model_name, params)
    object = model_name.to_s.classify.constantize.where(params).last
  end

  def find_all(model_name, params)
    objects = model_name.to_s.classify.constantize.where(params).all
  end
end

