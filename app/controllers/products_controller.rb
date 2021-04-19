class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end

  def search
    @products = Product.search_product(params[:search], params[:category])
    render 'index'
  end
end
