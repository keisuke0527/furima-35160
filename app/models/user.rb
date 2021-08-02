class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nick_name
  validates :birthday
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  end
  with_options format:{with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
  validates :last_name
  validates :first_name
  end
  with_options format:{with: /\A[ァ-ヶー－]+\z/} do
  validates :last_name_kana
  validates :first_name_kana
  end
  with_options format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }do
  validates :password
end
end

