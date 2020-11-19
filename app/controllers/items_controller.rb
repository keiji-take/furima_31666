class ItemsController < ApplicationController
  # before_action :unsigned_user, only: [:new, :create ]
  before_action :set_action, only: [:show, :edit]
  before_action :edit_user, only: [:edit]
  before_action :authenticate_user! , only:[:new, :create, :edit, :delete] 
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    item = Item.find(params[:id])
      if item.update(item_params)
        redirect_to item_path(item.id)
      end
  end

  private

  def item_params
    params.require(:item).permit(:product, :exception, :category_id, :condition_id, :payer_id, :location_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_action
    @item = Item.find(params[:id])
  end
  # def unsigned_user
  #   redirect_to root_path unless user_signed_in?
  # end
  def edit_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
