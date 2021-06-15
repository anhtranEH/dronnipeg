class ProductsController < ApplicationController
  before_action :setup_current_category, only: [:index, :search]

  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end

  def search
    @products = Product.search_product(params[:search], params[:category])
    render "index"
  end

  private

  def setup_current_category
    @current_category = params[:category]
  end
end
