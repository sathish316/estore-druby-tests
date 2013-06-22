class OrdersController < ApplicationController
  def create
    @cart = Cart.find_by_user_id(current_user.id)
    order = @cart.create_order
    redirect_to order_path(order.id)
  end

  def show
    @order = Order.find(params[:id])
    @products_by_id = Product.all.index_by {|p| p['id']}
  end

  def index
    @orders = Order
    @orders = @orders.where(status: params[:status]) unless params[:status].blank?
    @orders = @orders.all
  end

  def fulfill
    @order = Order.find(params[:id])
    @order.fulfill
    redirect_to orders_path
  end
end
