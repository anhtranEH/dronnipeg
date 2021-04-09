class CartController < ApplicationController
  def create
    logger.debug("Add #{params[:product_id]} to the cart")
    id = params[:product_id]
    session[:cart] << id
    flash[:notice] = "Add #{Product.find(id).name} to cart"
  end

  def destroy
    logger.debug("Remove #{params[:product_id]} to the cart")
    id = params[:product_id]
    session[:cart].delete(id)
    flash[:notice] = "Remove #{Product.find(id).name} to cart"
  end
end
