class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :scheduled_day
  has_one_attached :image

  with_options presence: true do
  validates :item_name
  validates :description 
  validates :price
  end
  with_options numericality: { other_than: 1 }do  
  validates :category_id
  validates :status_id 
  validates :delivery_charge_id
  validates :area_id
  validates :scheduled_day_id
end
end


