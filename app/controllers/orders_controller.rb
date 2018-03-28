class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.where(payed: false)
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find_or_create_by(user_id: current_user.id, product_id: @product.id, payed: false)
    @order.quantity += 1
    @order.save
  end

  def destroy
  end
end
