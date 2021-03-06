class OrdersController < ApplicationController

  before_action :set_num, except: :destroy


  def index
    if current_user.present?
      @orders = Order.where(user_id: current_user.id, payed: false).order(:id)
    else
      @orders = Order.where(session: session.id, payed: false).order(:id)
    end

  end

  def create
    session[:orders] ||= []
    @product = Product.find(params[:product_id])
    if current_user.present?
      @order = Order.find_or_create_by(user_id: current_user.id, product_id: @product.id, payed: false)
      @order.quantity += 1
      @order.save
    else
      @order = Order.find_or_create_by(session: session.id, product_id: @product.id, payed: false)
      @order.quantity += 1
      @order.save
    end
  end

  def update_quiantity
    @order = Order.find(params[:id])
    @order.quantity = params[:quantity]
    @order.save
    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def quote
    UserMailer.quotation(current_user).deliver_now
    @orders = Order.where(user_id: current_user.id, payed: false)
    @orders.update_all(payed: true)
    redirect_to root_path, notice: 'tu cotización se envío te responderemos a la brevedad'
  end



  private
    def set_num
      if current_user.present?
        @total = Order.where(user_id: current_user.id, payed: false).inject(0) { |sum, order| sum += (order.quantity.to_i * order.product.price.to_i) }
      else
        @total = Order.where(session: session.id, payed: false).inject(0) { |sum, order| sum += order.quantity.to_i * order.product.price.to_i }
      end
    end
end
