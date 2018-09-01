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
  # Shows the contact form page
  def contact
    @message = message(message_params)
  end

  # Sends the message.
  def send_message_email
    @message = message(message_params)
    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

  private

    def message_params
      params.require(:message).require(:name, :email, :content)
    end

    def valid_email?(email)
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      email.present? && (email =~ VALID_EMAIL_REGEX)
    end
  end
end
