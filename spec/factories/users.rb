FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'0000000'}
    password_confirmation {'0000000'}
    first_name       {"sasaki"}
    last_name        {"goro"}
    first_name_kana  {"sasaki"}
    last_name_kana   {"goro"}
    birthday         {"1990-08-24"}
  end
 end
