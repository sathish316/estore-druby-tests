class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @products_by_id = Product.all.index_by{|p| p['id']}
  end
end
