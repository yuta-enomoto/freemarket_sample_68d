class Sele < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order

  validates :revenue, :profit, presence: true

  scope :date_desc, -> {order(created_at: :desc)}
end
