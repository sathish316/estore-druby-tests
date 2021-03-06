require 'drb/drb'

class PurchaseOrder < ActiveRecord::Base
  include DRbUndumped
  extend DRbUndumped
end

class PurchaseOrderItem < ActiveRecord::Base
  include DRbUndumped
  extend DRbUndumped
end

class DRbHelper
  def create(model_name, params)
    object = FactoryGirl.create(model_name, params)
  end

  def find(model_name, params)
    object = model(model_name).where(params).first
  end

  def find_all(model_name, params)
    objects = model(model_name).where(params).all
  end

  def model(model_name)
    model_name.to_s.classify.constantize
  end
end
