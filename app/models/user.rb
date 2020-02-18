class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :items
  has_many :orders
  has_one :credit_card
  has_one :address

  validates :nickname, :first_name, :last_name, :birthday, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password,  presence: true, length: { minimum: 7 } 
  validates :first_furigana, :last_furigana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は、全角カタカナのみで入力して下さい。"
                 }
end