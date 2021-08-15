class OrdersController < ApplicationController

  def index
  end
 
  def new
    @order_recidence = OrderRecidence.new   #「UserDonation」に編集
  end
 
  def create

  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def donation_params
   params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
  end

end
