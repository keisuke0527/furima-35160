FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    first_name       { '鈴木' }
    last_name        { '吾郎' }
    first_name_kana  { 'スズキ' }
    last_name_kana   { 'ゴロウ' }
    birthday         { '1990-08-24' }
  end
end
