class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe!
    # redirect the user back to a payment screen
    @product = Product.find(params[:product_id])

    if @product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:         checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:          checkout_cancel_url,
      line_items:          [
        {
          name:        @product.name,
          description: @product.description,
          amount:      @product.price.to_i,
          currency:    "cad",
          quantity:    1
        },
        {
          name:        "GST",
          description: "Goods and Services Tax",
          amount:      (@product.price * 0.05).to_i,
          currency:    "cad",
          quantity:    1
        }
      ]
    )

    # @session.id <== is autopopulated from this process!

    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
      format.html{ "Finish" }
    end
  end

  def success
    # WE TOOK YO MONEY!
    # stripe success_url +"?session_id={CHECKOUT_SESSION_ID}"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @customer = current_user
  end

  def cancel
    # Something went wrong
  end
end
