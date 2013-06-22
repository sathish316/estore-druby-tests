def store_drb
  @store_drb ||= Drb::Store.new.drb
end

def catalog_drb
  @catalog_drb ||= Drb::Catalog.new.drb
end

def warehouse_drb
  @warehouse_drb ||= Drb::Warehouse.new.drb
end

def purchasing_drb
  @purchasing_drb ||= Drb::Purchasing.new.drb
end

def shipping_drb
  @shipping_drb ||= Drb::Shipping.new.drb
end
