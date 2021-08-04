require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
end

before do
  @item = FactoryBot.build(:item)
end

describe '出品商品新規登録' do

 context '新規登録できるとき' do
  it '必要な情報を適切に入力すれば登録できる' do
  expect(@item).to be_valid
 end
 it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
  @item = FactoryBot.create(:user)
  expect(@item).to be_valid
end
end

context '新規登録できないとき' do

 it 'imageが空では登録できない' do
  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Image can't be blank")
 end

 it '商品名が必須であること' do
  @item.item_name = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Item name can't be blank")
end

 it 'descriptionが空では登録できない' do
  @item.description = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Description can't be blank")
 end

 it 'categoryが空では登録できない' do
  @item.category_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Category is not a number")

 end
 it 'statusが空では登録できない' do
  @item.status_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Status is not a number")
 end

 it 'delivery_chargeが空では登録できない' do
  @item.delivery_charge_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery charge is not a number")
 end

 it 'areaが空では登録できない' do
  @item.area_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Area is not a number")
 end

 it 'scheduled_dayが空では登録できない' do
  @item.scheduled_day_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Scheduled day is not a number")
 end

 it 'priceが空では登録できない' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
 end

 it 'priceが¥300~¥9,999,999の間でないと登録できない' do
  @item.price = '10'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
 end

 it 'priceが半角数字でないと登録できない' do
  @item.price = '１２３４５'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
 end
end
end
end



