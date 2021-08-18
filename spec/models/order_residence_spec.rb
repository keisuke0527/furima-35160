require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '#create' do
  end

  before do
    @order_residence = FactoryBot.build(:order_residence)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@order_residence).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @order_residence = FactoryBot.create(:user)
        expect(@order_residence).to be_valid
      end
     end

     context '新規登録できないとき' do

      it '郵便番号が空では登録できない' do
        @order_residence.postal_code = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '都道府県が空では登録できない' do
        @order_residence.area_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it '市区町村が空では登録できない' do
        @order_residence.city = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_residence.address = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_residence.phone_number = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '郵便番号の保存にはハイフンがないと登録できない' do
        @order_residence.postal_code = '1234567'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code is invalid")
      end
      it '電話番号は11桁以内の数値でないと登録できない' do
        @order_residence.phone_number = '123451234512345'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
  end
