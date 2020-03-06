class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images
  has_many :likes, dependent: :destroy
  
  def like_user(user_id, item_id)
    Like.find_by(user_id: user_id, item_id: item_id)
  end
  
  has_one :order
  has_many :item_images, dependent: :destroy
  has_one :order, dependent: :destroy
  has_one :sele, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
 
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_who
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :prefecture_id, :condition_id, :shipping_fee_who_id, :shipping_days_id, :item_images, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 300, less_than: 9999999}

  scope :date_desc, -> {order(created_at: :desc)}

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end