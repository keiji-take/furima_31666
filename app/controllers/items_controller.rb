class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product, :exception, :category_id, :condition_id, :payer_id, :location_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
