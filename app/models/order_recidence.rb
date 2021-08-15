class OrderRecidence
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :phone_number, :city, :building_name, 

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :city
    validates :building_name
  end
    validates :category_id, numericality: { other_than: 1 } 

    def save
      order = Order.create(user_id:user_id, item_id:item_id,)
      Recidence.create(postal_code:postal_code, area_id:area_id, municipality:municipality, address:address, phone_number:phone_number, city:city, building_name:building_name, order_id: order.id)

    end
end