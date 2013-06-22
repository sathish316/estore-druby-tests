Before do
  purchasing_drb.model(:purchase_order).delete_all
  purchasing_drb.model(:purchase_order_item).delete_all
  warehouse_drb.model(:inventory_item).delete_all
  shipping_drb.model(:delivery_item).delete_all
  store_drb.model(:order).delete_all
  store_drb.model(:order_item).delete_all
  store_drb.model(:cart).delete_all
  store_drb.model(:cart_item).delete_all
end

Given /^EStore has ordered "(.*?)" units of "(.*?)" book with id "(.*?)" from "(.*?)"$/ do |quantity, product_title, product_id, supplier|
  po_page = Page::Purchasing::PurchaseOrder.new
  @po_id = po_page.create_order(supplier)
  po_item_page = Page::Purchasing::PurchaseOrderItem.new(@po_id)
  po_item_page.add_item(product_id, quantity)
  puts "Created Purchase order #{@po_id}"
end

Given /^all items are received from supplier "(.*?)" for product "(.*?)"$/ do |supplier, product_id|
  purchase_order_page = Page::Purchasing::PurchaseOrder.new(@po_id)
  purchase_order_page.receive_items
  puts "Received Items in Purchase order #{@po_id}"
  sleep(1)
end

Given /^inventory is stocked with "(.*?)" units of "(.*?)" book with id "(.*?)"$/ do |quantity, product_title, product_id|
  inventory_item = warehouse_drb.find(:inventory_item, product_id: product_id)
  inventory_item.quantity.should == quantity.to_i
  puts "Inventory item found: (#{inventory_item.inspect}) with quantity: #{inventory_item.quantity}"
end

When /^I add "(.*?)" book with id "(.*?)" to my shopping cart$/ do |product_title, product_id|
  product_listing_page = Page::Store::ProductListing.new
  @cart_id = product_listing_page.add_to_cart(product_id)
  puts "Adding Product #{product_id} to Cart #{@cart_id}"
end

When /^I checkout and place order$/ do
  cart_page = Page::Store::Cart.new(@cart_id)
  @order_id = cart_page.place_order
  puts "Placing order: #{@order_id}"
end

Then /^Order gets fulfilled$/ do
  orders_page = Page::Store::Orders.new
  orders_page.fulfill(@order_id)
  order_page = Page::Store::Order.new(@order_id)
  order_page.status.should == 'fulfilled'
  puts "Fulfilled order: #{@order_id}"
  sleep(1)
end

Then /^Inventory quantity for "(.*?)" book with id "(.*?)" must be "(.*?)"$/ do |product_title, product_id, quantity|
  inventory_item = warehouse_drb.find(:inventory_item, product_id: product_id)
  inventory_item.quantity.should == quantity.to_i
  puts "Inventory item found: (#{inventory_item.inspect}) with quantity: #{inventory_item.quantity}"
  sleep(1)
end

Then /^Delivery item must be created for "(.*?)" book with id "(.*?)" for "(.*?)" quantity$/ do |product_title, product_id, quantity|
  delivery_item = shipping_drb.find(:delivery_item, product_id: product_id)
  delivery_item.quantity.should == quantity.to_i
  puts "Delivery item found: (#{delivery_item.inspect}) with quantity: #{delivery_item.quantity}"
end
