class SimplePagesController < ApplicationController
  def index
    @products = Product.limit(5)
  end

  def landing_page
    @products = Product.limit(5)
  end

  def login
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
