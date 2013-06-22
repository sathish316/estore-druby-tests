module Page
  module Store
    class ProductListing
      include Capybara::DSL
      attr_reader :base_url

      def initialize
        @base_url = "http://localhost:4001/products"
      end

      def add_to_cart(product_id)
        visit @base_url
        find("#add-to-cart-#{product_id}").click
        cart_id = find("#shopping-cart-id").value 
      end
    end
  end
end
