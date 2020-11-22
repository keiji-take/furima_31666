class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
  end
  private
  def order_params
    params.require(:token).permit(:token).merge( item: params[:price])
  end
end
