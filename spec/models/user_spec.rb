require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages)
    end
    it 'passwordは、半角英数字が混合されていれば、登録が可能なこと' do
      @user.password = "000aaa"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'last_nameは、全角での入力でないと登録できない' do
      @user = build(:user, first_name: "アイウエオ")
      @user.valid?
      expect(user.errors[:first_name])
    end
    it 'last_name_kanaは、全角（カタカナ）での入力でないと登録できない' do
      user = build(:user, last_name_kana: "kana")
      user.valid?
      expect(user.errors[:last_name_kana])
    end
    it 'first_name_kanaは、全角（カタカナ）での入力でないと登録できない' do
      user = build(:user, first_name_kana: "kana")
      user.valid?
      expect(user.errors[:first_name_kana])
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    
  end
end