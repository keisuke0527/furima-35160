class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nick_name
  validates :last_name, format:/\A[ぁ-んァ-ン一-龥]/
  validates :first_name, format:/\A[ぁ-んァ-ン一-龥]/
  validates :last_name_kana, format:/\A[ァ-ヶー－]+\z/
  validates :first_name_kana,  format:/\A[ァ-ヶー－]+\z/
  validates :birthday
  end
end

