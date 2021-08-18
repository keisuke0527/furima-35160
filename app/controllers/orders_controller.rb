class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :contributor_confirmation, only: [:index,:create]

  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new  
  end 
 
 
  def create
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new(residence_params)
    
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
  end
 end
 
  private

  def residence_params
   params.require(:order_residence).permit(:postal_code, :address, :phone_number, :city, :building_name, :area_id).merge(user_id:current_user.id, token: params[:token],item_id: params[:item_id])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: residence_params[:token],
    currency: 'jpy'                 
  )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user != @item.user 
  end
  
end
