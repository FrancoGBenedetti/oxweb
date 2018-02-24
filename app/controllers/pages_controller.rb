class PagesController < ApplicationController
  def index
  end

  def catalogue
    @products = Product.all
  end

  def about
  end

  def contact
  end
end
