class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end
end
