class AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  def dashboard
    @products = Product.all
  end

  def catalogo
    if Catalogo.last
      @catalogo = Catalogo.last
    else
      @catalogo = Catalogo.new
    end
  end
end
