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

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
        to: 'khuggins22@gmail.com',
        subject: "A new contact form message from #{@name}",
        body: @message).deliver_now
  end
end
