module Page
  module Purchasing
    class PurchaseOrderItem
      include Capybara::DSL

      attr_reader :base_url

      def initialize(purchase_order_id)
        @purchase_order_id = purchase_order_id
        @base_url = "http://localhost:4004/purchase_order_items"
      end

      def add_item(product_id, quantity)
        price = 100.0
        visit new_url
        fill_in 'Product', with: product_id
        fill_in 'Quantity', with: quantity
        fill_in 'Price', with: price
        fill_in 'Purchase order', with: @purchase_order_id
        click_button 'Create Purchase order item'
        puts "Purchase order item created in #{@purchase_order_id} for product #{product_id}"
      end

      def new_url
        @base_url + "/new"
      end
    end
  end  
end
