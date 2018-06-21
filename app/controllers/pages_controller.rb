class PagesController < ApplicationController
  before_action :set_num, except: :mh3
  before_action :set_catalogo
  def index
    @products = Product.all
  end

  def catalogue
    @products = Product.all
  end

  def about
  end

  def contact
  end

  def mh3
  end

  private
    def set_num
      if current_user.present?
        @num = Order.where(user_id: current_user.id, payed:   false).inject(0) { |sum, order| sum += order.quantity }
      end
    end

    def set_catalogo
      @catalogo = Catalogo.last
    end
end
