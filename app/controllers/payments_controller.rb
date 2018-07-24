class PaymentsController < ApplicationController

def create
    @product = Product.find(params[:product_id])
    @user = current_user

    token = params[:stripeToken]

    begin

      # Amount in cents
      @amount = (@product.price * 100).to_i,

      # customer = Stripe::Customer.create(
      #   :email => params[:stripeEmail],
      #   :source  => params[:stripeToken]
      # )

      charge = Stripe::Charge.create(
        # customer: customer.id,
        amount: (@product.price * 100).to_i,
        currency: "dollar",
        source: token,
        description: "Magical Unicorn Dust '"+@product.name+"'",
        metadata: {
          'Email-address:' => params[:stripeEmail]
        },
        receipt_email: params[:stripeEmail]
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        flash[:success] = "Your payment was processed successfully"
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Oops, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end

end
