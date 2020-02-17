class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images
  has_one :order
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_who
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
