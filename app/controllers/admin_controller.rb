class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
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

  def import
  end
  
  private

    def check_admin
      if !current_user.admin?
        redirect_to root_path
      end
    end
end
