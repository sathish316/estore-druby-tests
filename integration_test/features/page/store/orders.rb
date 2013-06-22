module Page
  module Store
    class Orders
      include Capybara::DSL
      attr_reader :base_url

      def initialize
        @base_url = "http://localhost:4001/orders"
      end

      def fulfill(order_id)
        visit base_url
        find("#fulfill-order-#{order_id}").click
      end
    end
  end
end
