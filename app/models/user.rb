class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :last_name, presence: true, format:/\A[ぁ-んァ-ヶー－]+\z/, format:/\A[一-龥]+\z/
  validates :first_name, presence: true, format:/\A[ぁ-んァ-ヶー－]+\z/, format:/\A[一-龥]+\z/
  validates :last_name_kana, presence: true, format:/\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true, format:/\A[ァ-ヶー－]+\z/
  validates :birthday, presence: true
  
end

