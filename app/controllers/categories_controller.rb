class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    @category = Category.includes(:products).find(params[:id])
  end
end
