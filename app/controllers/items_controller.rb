class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = Item.includes(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id,
                                 :scheduled_day_id, :price).merge(user_id: current_user.id)
  end
end
