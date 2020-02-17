class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :postal_code, presence: true
  validates :address1, presence: true
  validates :address2, presence: true

end
