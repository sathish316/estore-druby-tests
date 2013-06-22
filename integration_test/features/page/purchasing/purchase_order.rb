module Page
  module Purchasing
    class PurchaseOrder
      include Capybara::DSL

      attr_reader :base_url
 
      def initialize(purchase_order_id=nil)
        @purchase_order_id = purchase_order_id
        @base_url = "http://localhost:4004/purchase_orders"
      end

      def create_order(supplier)
        visit new_url
        fill_in 'Supplier', with: supplier 
        click_button 'Create Purchase order' 
        po_id = find('#purchase-order-id').text
      end

      def new_url
        @base_url + "/new"
      end

      def receive_items
        visit show_url
        click_button 'Receive Items'
      end
 
      def show_url
        "#{@base_url}/#{@purchase_order_id}"
      end
    end
  end
end
