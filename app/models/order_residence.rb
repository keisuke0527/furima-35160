class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :address, :phone_number, :city, :building_name,:user_id, :item_id, :order_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :city
    validates :area_id, numericality: { other_than: 1 } 
    validates :token
    validates :user_id
    validates :item_id
    end


    def save
      order = Order.create(user_id:user_id, item_id:item_id)
      Residence.create(postal_code:postal_code, area_id:area_id, address:address, phone_number:phone_number, city:city, building_name:building_name, order_id: order.id)

    end
end