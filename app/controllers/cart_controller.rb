class CartController < ApplicationController
  def index
    @current_cart = session[:cart]
  end
  def create
    logger.debug("Add #{params[:product_id]} to the cart")
    id = params[:product_id]
    current_cart = session[:cart]
    current_cart[id] = current_cart[id].to_i + 1
    session[:cart] = current_cart
    flash[:notice] = "Add #{Product.find(id).name} to cart"
    redirect_to products_path
  end

  def destroy
    logger.debug("Remove #{params[:product_id]} to the cart")
    id = params[:product_id]
    session[:cart].delete(id)
    flash[:notice] = "Remove #{Product.find(id).name} to cart"
    redirect_to cart_index_path
  end

  def update_cart
    if params.has_value?("Remove")
      id = params.select{ |k,v| v == 'Remove' }.keys.first.split('_').last
      session[:cart].delete(id)
      flash[:notice] = "Remove #{Product.find(id).name} to cart"
    else
      current_cart = session[:cart]
      current_cart.keys.each do |k|
        current_cart[k] = params[k].to_i if params[k].present?
      end
      session[:cart] = current_cart
      flash[:notice] = "Updated!"
    end
    redirect_to cart_index_path
  end
end
