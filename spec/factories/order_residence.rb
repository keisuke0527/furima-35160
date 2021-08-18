FactoryBot.define do
  factory :order_residence do
    postal_code      { '123-4567' }
    address          { '1-1'}
    phone_number     { '09012345678' }
    city             { '名古屋' }
    building_name    { 'ビルビル' }
    area_id          { 2 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

