class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(5)
  end

  def landing_page
    @products = Product.limit(5)
  end

  def index
    redirect_to "/simple_pages/login"
  end

  def login
  end

end
