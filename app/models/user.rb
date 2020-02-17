class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_one :credit_card
  has_one :address

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_furigana, presence: true
  validates :last_furigana, presence: true
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: true

end