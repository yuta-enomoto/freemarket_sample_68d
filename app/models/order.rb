class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :sele, dependent: :destroy
end
