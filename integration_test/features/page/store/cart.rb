module Page
  module Store
    class Cart
      include Capybara::DSL
      attr_reader :base_url

      def initialize(cart_id)
        @cart_id = cart_id
        @base_url = "http://localhost:4001/carts/#{@cart_id}"
      end

      def place_order
        visit base_url
        click_button 'Place order'
        order_id = find('#order-id').value
      end
    end
  end
end
