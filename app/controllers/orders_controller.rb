class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_num, except: :destroy

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

  private
    def set_num
      if current_user.present?
        @num = Order.where(user_id: current_user.id, payed:   false).inject(0) { |sum, order| sum += order.quantity }
      end
    end
end
