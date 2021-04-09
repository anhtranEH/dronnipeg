class CheckoutController < ApplicationController
  def create
    # establish a connection with Stripe!
    # redirect the user back to a payment screen
    current_cart = session[:cart]

    if current_cart.empty?
      redirect_to root_path
      return
    end


    line_items = cart.map do |product|
      {
        name:        product.name,
        description: product.description,
        amount:      product.price.to_i * 100,
        currency:    "cad",
        quantity:    current_cart[product.id.to_s].to_i
      }
    end

    sub_total = cart.inject(0) do |sum, item|
      sum + (item.price.to_i * current_cart[item.id.to_s].to_i * 100)
    end

    gst = current_user.province.gst
    hst = current_user.province.hst
    pst = current_user.province.pst

    gst_info = {
      name:        "GST",
      description: "Goods and Services Tax",
      amount:      (sub_total * gst).to_i,
      currency:    "cad",
      quantity:    1
    }

    hst_info = {
      name:        "HST",
      description: "High Service Tax",
      amount:      (sub_total * hst).to_i,
      currency:    "cad",
      quantity:    1
    }

    pst_info = {
      name:        "PST",
      description: "Province Tax",
      amount:      (sub_total * pst).to_i,
      currency:    "cad",
      quantity:    1
    }

    line_items << hst_info if hst != 0
    line_items << gst_info if gst != 0
    line_items << pst_info if pst != 0

    total_tax = sub_total * ( gst + hst + pst )

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:         checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:          checkout_cancel_url,
      line_items:          line_items
    )

    # @session.id <== is autopopulated from this process!

    order = Order.create(order_date: DateTime.now, order_state: 1, total_tax: total_tax/100 , grand_total: (sub_total + total_tax)/100, user_id: current_user.id, payment_id: @session.payment_intent)
    cart.each do |product|
      OrderDetail.create(price: product.price,
                         quantity: current_cart[product.id.to_s],
                         product_id: product.id,
                         order_id: order.id,
                         tax_rate: gst + hst + pst )
    end
    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # WE TOOK YO MONEY!
    # stripe success_url +"?session_id={CHECKOUT_SESSION_ID}"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @customer = current_user
    session[:cart] = {}
    @order = Order.find_by(payment_id: @payment_intent.id)
    @order.update(order_state: 2)
    #Retrieve current order object and display in view
    #Update order status to paid, add payment id
  end

  def cancel
    # Something went wrong
  end

  private

  def tax_generator
  end
end
