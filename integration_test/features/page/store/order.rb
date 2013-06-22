module Page
  module Store
    class Order
      include Capybara::DSL
      attr_reader :base_url

      def initialize(order_id)
        @order_id = order_id
        @base_url = "http://localhost:4001/orders/#{@order_id}"
      end

      def status
        visit base_url
        find('#order-status').value
      end
    end
  end
end
