class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images
  has_one :order
  accepts_nested_attributes_for :item_images, allow_destroy: true
 
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_who
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :prefecture_id, :condition_id, :shipping_fee_who, :shipping_days, :item_images, presence: true
end
