class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_act, only: [:index, :create]
  before_action :buy_user, only: [:index]
  def index
    @order_trade = OrderTrade.new
  end

  def create
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

  def set_act
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_trade).permit(:post_code, :prefecture, :city, :house_num, :building_name, :tel).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def buy_user
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
