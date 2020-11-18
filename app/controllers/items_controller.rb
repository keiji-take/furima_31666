class ItemsController < ApplicationController
  # before_action :unsigned_user, only: [:new, :create ]
  # before_action :current_user, only: [:edit, :update]

  def index
  end
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to root_path
    end
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
  end
  def update
  end

  private
  def item_params
    params.require(:item).permit(:product, :exception, :category_id, :condition_id, :payer_id, :location_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def unsigned_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
  # def current_user
  #   unless current_user.id == @item.user.id
  #     redirect_to root_path
  #   end
  # end
  
end
