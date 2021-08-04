FactoryBot.define do
  factory :item do
    item_name           { Faker::Lorem.sentence }
    description         { Faker::Lorem.sentence }
    category_id            { 2 }
    status_id              { 2 }
    delivery_charge_id     { 2 }
    area_id                { 2 }
    scheduled_day_id       { 2 }
    price { 10_000 }
    user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
