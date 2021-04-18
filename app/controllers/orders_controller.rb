class OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).order(:created_at)
  end

  def show
    @order = Order.find(params[:id])
  end
end
