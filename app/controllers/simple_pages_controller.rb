class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(5)
  end

  def landing_page
    @products = Product.limit(5)
  end

end
