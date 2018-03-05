class AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'adminlayout'

  def dashboard
    @products = Product.all
  end
end
