class PagesController < ApplicationController
  def index
  @products = []
  3.times do
    @products << Product.all.sample
  end

    
  end

  def catalogue
    @products = Product.all
  end

  def about
  end

  def contact
  end
end
