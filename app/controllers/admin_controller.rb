class AdminController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @products = Product.all
  end
end
