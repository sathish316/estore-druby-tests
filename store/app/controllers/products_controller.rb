class ProductsController < ApplicationController
  def index
    @cart = user_cart
    @categories = Category.all
    category_id = params[:category_id]
    @products = Product.all(category_id)
  end

  def add_to_cart
    @cart = user_cart
    @cart.add_item(params[:product_id])
    redirect_to(@cart)
  end

  private

  def user_cart
    Cart.find_or_create_by_user_id(current_user.id)
  end
end
