class ItemsController < ApplicationController
  before_action :set_item,  only: [:show, :edit,:update, :destroy ]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :contributor_confirmation, only: [:edit, :update , :destroy]

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
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
     redirect_to root_path
    else
     render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :delivery_charge_id, :area_id,
                                 :scheduled_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user ==  @item.user 
  end

end
