class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_trade = OrderTrade.new
  end
  def create
    @item = Item.find(params[:item_id])
    @order_trade = OrderTrade.new(order_params)
    if @order_trade.valid?
      pay_item
      @order_trade.save
      redirect_to root_path
    else 
      render 'index'
    end
    
  end

  private

  def order_params
    params.require(:order_trade).permit(:post_code, :prefecture, :city, :house_num, :building_name, :tel).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
