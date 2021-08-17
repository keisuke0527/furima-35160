class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new  
  end
 
 
  def create
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new(residence_params)
    if @order_residence.valid?
      @order_residence.save
      redirect_to action: :index
    else
      render :index
  end
 end
 
  private

  def residence_params
   params.require(:order_residence).permit(:postal_code, :address, :phone_number, :city, :building_name, :area_id).merge(user_id:current_user.id, order_id: params[:order_id],item_id: params[:item_id])
  end

end
