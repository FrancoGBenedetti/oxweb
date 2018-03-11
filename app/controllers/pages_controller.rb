class PagesController < ApplicationController
  def index
  @products = []
  @products << Product.find_by(cod: '180013')
  @products << Product.find_by(cod: '180012')
  @products << Product.find_by(cod: '180011')

  end

  def catalogue
    @products = Product.all
  end

  def about
  end

  def contact
  end
end
